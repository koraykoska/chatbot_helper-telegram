module ChatbotHelper
  module Telegram
    # A base collection resource class
    class CollectionResource < ChatbotHelper::Telegram::BaseResource
      class << self

        # Returns the type of the elements in this collection.
        #
        # Subclasses *must* override this and provide a type for the collection
        # which should be a subclass of +ChatbotHelper::Telegram::BaseResource+
        # or something similar.
        #
        # @return [BaseResource] The type of the elements in this collection
        def collection_type
          m = 'Subclasses of CollectionResource must implement '\
              'self.collection_type'
          raise NotImplementedError, m
        end

        def valid_resource?(resource)
          return false if resource.nil? || !resource.respond_to?('each')

          resource.each do |r|
            return false unless collection_type.valid_resource?(r)
          end

          # We are finished. Return true...
          true
        end
      end

      attr_reader :elements

      def initialize(json: nil, string: nil)
        super(json: json, string: string)

        @elements = []
        @json.each do |r|
          @elements << self.class.collection_type.new(json: r)
        end
      end

      include Enumerable

      def each(&block)
        @elements.each(&block)
      end
    end
  end
end
