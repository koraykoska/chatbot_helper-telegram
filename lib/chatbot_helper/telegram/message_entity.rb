module ChatbotHelper
  module Telegram
    # The message_entity resource which represents a Telegram bot API
    # message_entity
    class MessageEntity < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[type offset length]
        end

        def optional_fields
          %w[url]
        end

        def optional_objects
          [
            { name: 'user', type: ChatbotHelper::Telegram::User }
          ]
        end
      end
    end
  end
end
