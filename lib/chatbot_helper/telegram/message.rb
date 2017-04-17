module ChatbotHelper
  module Telegram
    # The message class which provides helpful methods for telegram bot messages
    class Message
      # Initializes a new Message object with the given json String
      #
      # @param json [String] The json String which represents a telegram bot api message
      # @return [ChatbotHelper::Telegram::Message] A new instance of Message created with the given json String
      def initialize(json:)
        @json = json
      end

      # Checks a given String and returns true iff it is a valid bot Message as
      # defined in the telegram bot documentation.
      #
      # See https://core.telegram.org/bots/api#message for more information
      # about the message structure.
      #
      # @param message [String] The message representing the Telegram bot API message Object as a json String
      # @return [Boolean] True iff the given message represents a valid Telegram bot API message
      def valid_message?(message)

      end
    end
  end
end
