# frozen_string_literal: true

require 'spec_helper'
require 'net/smtp'
require 'legion/extensions/smtp/runners/email'

# rubocop:disable Metrics/BlockLength
RSpec.describe Legion::Extensions::Smtp::Runners::Email do
  let(:smtp_session) { instance_double(Net::SMTP) }

  let(:runner) do
    Class.new { include Legion::Extensions::Smtp::Runners::Email }.new
  end

  let(:base_args) do
    {
      to:      'recipient@example.com',
      from:    'sender@example.com',
      subject: 'Test Subject',
      body:    'Hello, world!'
    }
  end

  before do
    allow(Net::SMTP).to receive(:start).and_yield(smtp_session)
    allow(smtp_session).to receive(:send_message)
  end

  describe '#send' do
    it 'opens an SMTP connection to localhost on port 25 by default' do
      runner.send(**base_args)
      expect(Net::SMTP).to have_received(:start).with('localhost', 25)
    end

    it 'opens an SMTP connection to the given address and port' do
      runner.send(**base_args, address: 'smtp.example.com', port: 587)
      expect(Net::SMTP).to have_received(:start).with('smtp.example.com', 587)
    end

    it 'sends the message body' do
      runner.send(**base_args)
      expect(smtp_session).to have_received(:send_message).with(
        base_args[:body],
        base_args[:from],
        base_args[:to],
        base_args[:subject]
      )
    end

    it 'passes the correct from address' do
      runner.send(**base_args, from: 'other@example.com')
      expect(smtp_session).to have_received(:send_message).with(
        anything,
        'other@example.com',
        anything,
        anything
      )
    end

    it 'passes the correct to address' do
      runner.send(**base_args, to: 'dest@example.com')
      expect(smtp_session).to have_received(:send_message).with(
        anything,
        anything,
        'dest@example.com',
        anything
      )
    end

    it 'passes the correct subject' do
      runner.send(**base_args, subject: 'My Subject')
      expect(smtp_session).to have_received(:send_message).with(
        anything,
        anything,
        anything,
        'My Subject'
      )
    end

    it 'ignores extra keyword arguments' do
      expect { runner.send(**base_args, extra_key: 'ignored') }.not_to raise_error
    end

    context 'when the SMTP server raises an error' do
      before do
        allow(Net::SMTP).to receive(:start).and_raise(Net::SMTPFatalError, '550 User unknown')
      end

      it 'propagates the SMTP error' do
        expect { runner.send(**base_args) }.to raise_error(Net::SMTPFatalError)
      end
    end

    context 'when connection is refused' do
      before do
        allow(Net::SMTP).to receive(:start).and_raise(Errno::ECONNREFUSED)
      end

      it 'propagates the connection error' do
        expect { runner.send(**base_args) }.to raise_error(Errno::ECONNREFUSED)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
