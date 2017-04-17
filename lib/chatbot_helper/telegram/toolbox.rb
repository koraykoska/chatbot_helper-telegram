require 'json'

module ChatbotHelper
  module Telegram
    # A toolbox which provides useful internal helpers for this library.
    #
    # Please don't use these methods as they are subject to chhange any time
    # and are not documented in any way.
    module Toolbox
      def self.parse_json(json)
        p = JSON.parse(json)
        return p
      rescue TypeError, JSON::ParserError => e
        return nil
      end
    end
  end
end
