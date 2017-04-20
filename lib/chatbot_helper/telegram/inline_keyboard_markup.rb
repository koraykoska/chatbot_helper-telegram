module ChatbotHelper
  module Telegram
    # The inline_keyboard_markup resource which represents a Telegram bot API
    # inline_keyboard_markup
    class InlineKeyboardMarkup < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_arrays
          [
            { name: 'inline_keyboard',
              type: ChatbotHelper::Telegram::InlineKeyboardButtonCollection }
          ]
        end
      end
    end
  end
end
