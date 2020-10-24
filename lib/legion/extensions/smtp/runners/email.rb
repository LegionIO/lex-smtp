require 'net/smtp'

module Legion
  module Extensions
    module Smtp
      module Runners
        module Email
          def send(to:, body:, from:, subject:, port: 25, address: 'localhost', **_opts) # rubocop:disable Metrics/ParameterLists
            Net::SMTP.start(address, port) do |smtp|
              smtp.send_message body, from, to, subject
            end
          end
        end
      end
    end
  end
end
