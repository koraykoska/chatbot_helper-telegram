module ChatbotHelper
  module Telegram
    # The game resource which represents a Telegram bot API game
    class Game < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[title description]
        end

        def optional_fields
          %w[text]
        end

        def optional_objects
          [
            { name: 'animation', type: ChatbotHelper::Telegram::Animation }
          ]
        end

        def required_arrays
          [
            { name: 'photo', type: ChatbotHelper::Telegram::PhotoSize }
          ]
        end

        def optional_arrays
          [
            { name: 'text_entities',
              type: ChatbotHelper::Telegram::MessageEntity }
          ]
        end
      end
    end
  end
end
