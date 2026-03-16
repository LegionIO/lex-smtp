# frozen_string_literal: true

require 'spec_helper'
require 'legion/extensions/smtp/client'

RSpec.describe Legion::Extensions::Smtp::Client do
  subject(:client) { described_class.new(**opts) }

  let(:opts) { { address: 'smtp.example.com', port: 587 } }

  describe '#initialize' do
    it 'stores options' do
      expect(client.opts[:address]).to eq('smtp.example.com')
    end

    it 'defaults address to localhost' do
      c = described_class.new
      expect(c.opts[:address]).to eq('localhost')
    end

    it 'defaults port to 25' do
      c = described_class.new
      expect(c.opts[:port]).to eq(25)
    end
  end

  describe '#connection' do
    it 'returns a Net::SMTP instance' do
      expect(client.connection).to be_a(Net::SMTP)
    end

    it 'uses configured address' do
      smtp = client.connection
      expect(smtp.address).to eq('smtp.example.com')
    end

    it 'uses configured port' do
      smtp = client.connection
      expect(smtp.port).to eq(587)
    end

    it 'allows overriding address' do
      smtp = client.connection(address: 'other.example.com')
      expect(smtp.address).to eq('other.example.com')
    end
  end

  describe '#send' do
    it 'responds to send' do
      expect(client).to respond_to(:send)
    end
  end
end
