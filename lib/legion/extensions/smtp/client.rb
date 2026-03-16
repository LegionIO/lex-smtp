# frozen_string_literal: true

require_relative 'helpers/client'
require_relative 'runners/email'

module Legion
  module Extensions
    module Smtp
      class Client
        include Runners::Email
        include Helpers::Client

        attr_reader :opts

        def initialize(**opts)
          @opts = { address: 'localhost', port: 25 }.merge(opts)
        end

        def connection(**override)
          merged = opts.merge(override)
          Net::SMTP.new(merged[:address], merged[:port])
        end
      end
    end
  end
end
