module ChatbotHelper
  module Telegram
    # The update resource which represents a Telegram bot API update
    class Update < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[update_id]
        end

        def optional_objects
          [
            { name: 'message', type: ChatbotHelper::Telegram::Message },
            { name: 'edited_message', type: ChatbotHelper::Telegram::Message },
            { name: 'channel_post', type: ChatbotHelper::Telegram::Message },
            { name: 'edited_channel_post',
              type: ChatbotHelper::Telegram::Message },
            { name: 'inline_query',
              type: ChatbotHelper::Telegram::InlineQuery },
            { name: 'chosen_inline_result',
              type: ChatbotHelper::Telegram::ChosenInlineResult },
            { name: 'callback_query',
              type: ChatbotHelper::Telegram::CallbackQuery }
          ]
        end
      end
    end
  end
end
