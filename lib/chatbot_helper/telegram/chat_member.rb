module ChatbotHelper
  module Telegram
    # The chat_member resource which represents a Telegram bot API chat_member
    class ChatMember < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[status]
        end

        def required_objects
          [
            { name: 'user', type: ChatbotHelper::Telegram::User }
          ]
        end
      end
    end
  end
end
