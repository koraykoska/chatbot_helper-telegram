module ChatbotHelper
  module Telegram
    # The chosen_inline_result resource which represents a Telegram bot API
    # chosen_inline_result
    class ChosenInlineResult < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[result_id query]
        end

        def optional_fields
          %w[inline_message_id]
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
