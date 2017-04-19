module ChatbotHelper
  module Telegram
    # The photo_size resource which represents a Telegram bot API photo_size
    class PhotoSize < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[file_id width height]
        end

        def optional_fields
          %w[file_size]
        end
      end
    end

    # A photo_size collection which represents an array of photo_size resources
    class PhotoSizeCollection < ChatbotHelper::Telegram::BaseResource
      class << self
        def valid_resource?(resource)
          return false if resource.nil? || !resource.respond_to?('each')

          resource.each do |r|
            unless ChatbotHelper::Telegram::PhotoSize.valid_resource?(r)
              return false
            end
          end
        end
      end

      attr_reader :elements

      def initialize(json: nil, string: nil)
        super(json: json, string: string)

        @elements = []
        @json.each do |r|
          @elements << ChatbotHelper::Telegram::PhotoSize.new(json: r)
        end
      end

      include Enumerable

      def each(&block)
        @elements.each(&block)
      end
    end
  end
end
