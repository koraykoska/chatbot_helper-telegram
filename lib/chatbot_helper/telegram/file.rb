module ChatbotHelper
  module Telegram
    # The file resource which represents a Telegram bot API file
    class File < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[file_id]
        end

        def optional_fields
          %w[file_size file_path]
        end
      end
    end
  end
end
