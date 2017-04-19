module ChatbotHelper
  module Telegram
    # The callback_query resource which represents a Telegram bot API
    # callback_query
    class CallbackQuery < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[id chat_instance]
        end

        def optional_fields
          %w[inline_message_id data game_short_name]
        end

        def required_objects
          [
            { name: 'from', type: ChatbotHelper::Telegram::User }
          ]
        end

        def optional_objects
          [
            { name: 'message', type: ChatbotHelper::Telegram::Message }
          ]
        end
      end
    end
  end
end
