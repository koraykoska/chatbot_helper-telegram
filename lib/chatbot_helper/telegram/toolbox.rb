require 'json'

module ChatbotHelper
  module Telegram
    # A toolbox which provides useful internal helpers for this library.
    #
    # Please don't use these methods as they are subject to chhange any time
    # and are not documented in any way.
    module Toolbox
      def self.parse_json(string)
        p = JSON.parse(string, max_nesting: false)
        return p
      rescue TypeError, JSON::ParserError => e
        return nil
      end

      def self.generate_json(json)
        p = JSON.generate(json, max_nesting: false)
        return p
      rescue JSON::GeneratorError => e
        return nil
      end
    end
  end
end
