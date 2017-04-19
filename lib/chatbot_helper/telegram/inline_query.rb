module ChatbotHelper
  module Telegram
    # The inline_query resource which represents a Telegram bot API inline_query
    class InlineQuery < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[id query offset]
        end

        def required_objects
          [
            { name: 'from', type: ChatbotHelper::Telegram::User }
          ]
        end

        def optional_objects
          [
            { name: 'location', type: ChatbotHelper::Telegram::Location },
          ]
        end
      end
    end
  end
end
