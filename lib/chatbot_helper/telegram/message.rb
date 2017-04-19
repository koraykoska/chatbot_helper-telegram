module ChatbotHelper
  module Telegram
    # The message resource which represents a Telegram bot API message
    class Message < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[message_id date]
        end

        def optional_fields
          %w[forward_from_message_id forward_date edit_date text caption
             new_chat_title delete_chat_photo group_chat_created
             supergroup_chat_created channel_chat_created migrate_to_chat_id
             migrate_from_chat_id]
        end

        def required_objects
          [
            { name: 'chat', type: ChatbotHelper::Telegram::Chat }
          ]
        end

        def optional_objects
          [
            { name: 'from', type: ChatbotHelper::Telegram::User },
            { name: 'forward_from', type: ChatbotHelper::Telegram::User },
            { name: 'forward_from_chat', type: ChatbotHelper::Telegram::Chat },
            { name: 'reply_to_message',
              type: ChatbotHelper::Telegram::Message },
            { name: 'audio', type: ChatbotHelper::Telegram::Audio },
            { name: 'document', type: ChatbotHelper::Telegram::Document },
            { name: 'game', type: ChatbotHelper::Telegram::Game },
            { name: 'sticker', type: ChatbotHelper::Telegram::Sticker },
            { name: 'video', type: ChatbotHelper::Telegram::Video },
            { name: 'voice', type: ChatbotHelper::Telegram::Voice },
            { name: 'contact', type: ChatbotHelper::Telegram::Contact },
            { name: 'location', type: ChatbotHelper::Telegram::Location },
            { name: 'venue', type: ChatbotHelper::Telegram::Venue },
            { name: 'new_chat_member', type: ChatbotHelper::Telegram::User },
            { name: 'left_chat_member', type: ChatbotHelper::Telegram::User },
            { name: 'pinned_message', type: ChatbotHelper::Telegram::Message }
          ]
        end

        def optional_arrays
          [
            { name: 'entities', type: ChatbotHelper::Telegram::MessageEntity },
            { name: 'photo', type: ChatbotHelper::Telegram::PhotoSize },
            { name: 'new_chat_photo', type: ChatbotHelper::Telegram::PhotoSize }
          ]
        end
      end
    end
  end
end
