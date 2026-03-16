# frozen_string_literal: true

require 'net/smtp'

module Legion
  module Extensions
    module Smtp
      module Helpers
        module Client
          def connection(address: 'localhost', port: 25, **_opts)
            Net::SMTP.new(address, port)
          end
        end
      end
    end
  end
end
