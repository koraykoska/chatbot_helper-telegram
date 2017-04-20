require 'json'

module ChatbotHelper
  module Telegram
    # A toolbox which provides useful internal helpers for this library.
    #
    # Please don't use these methods as they are subject to chhange any time
    # and are not documented in any way.
    module Toolbox
      def self.parse_json(string, opts = {})
        opts[:max_nesting] = false unless opts[:max_nesting]
        p = JSON.parse(string, opts)
        return p
      rescue TypeError, JSON::ParserError => e
        return nil
      end

      def self.generate_json(hash, opts = {})
        opts[:max_nesting] = false unless opts[:max_nesting]
        p = JSON.generate(hash, opts)
        return p
      rescue JSON::GeneratorError => e
        return nil
      end
    end
  end
end
