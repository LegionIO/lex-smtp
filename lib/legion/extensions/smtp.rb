require 'legion/extensions/smtp/version'

module Legion
  module Extensions
    module Smtp
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end
