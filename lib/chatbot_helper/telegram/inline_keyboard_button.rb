module ChatbotHelper
  module Telegram
    # The inline_keyboard_button resource which represents a Telegram bot API
    # inline_keyboard_button
    class InlineKeyboardButton < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[text]
        end

        def optional_fields
          %w[url callback_data switch_inline_query
             switch_inline_query_current_chat]
        end

        def optional_objects
          [
            { name: 'callback_game',
              type: ChatbotHelper::Telegram::CallbackGame }
          ]
        end
      end
    end

    # A inline_keyboard_button collection which represents an array of
    # inline_keyboard_button resources
    class InlineKeyboardButtonCollection <
      ChatbotHelper::Telegram::CollectionResource
      class << self
        def collection_type
          ChatbotHelper::Telegram::InlineKeyboardButton
        end
      end
    end
  end
end
