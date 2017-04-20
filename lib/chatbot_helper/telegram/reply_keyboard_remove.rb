module ChatbotHelper
  module Telegram
    # The reply_keyboard_remove resource which represents a Telegram bot API
    # reply_keyboard_remove
    class ReplyKeyboardRemove < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[remove_keyboard]
        end

        def optional_fields
          %w[selective]
        end
      end
    end
  end
end
