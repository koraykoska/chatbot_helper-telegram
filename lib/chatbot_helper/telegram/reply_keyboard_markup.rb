module ChatbotHelper
  module Telegram
    # The reply_keyboard_markup resource which represents a Telegram bot API
    # reply_keyboard_markup
    class ReplyKeyboardMarkup < ChatbotHelper::Telegram::BaseResource
      class << self
        def optional_fields
          %w[resize_keyboard one_time_keyboard selective]
        end

        def required_arrays
          [
            { name: 'keyboard',
              type: ChatbotHelper::Telegram::KeyboardButtonCollection }
          ]
        end
      end
    end
  end
end
