module Fixtures
  module Resources
    # The valid json and its result
    @valid_message = '{"message_id":4,"from":{"id":83441420,"first_name":"Koray","username":"Ybrin"},"chat":{"id":83441420,"first_name":"Koray","username":"Ybrin","type":"private"},"date":1492106508,"reply_to_message":{"message_id":2,"from":{"id":83441420,"first_name":"Koray","username":"Ybrin"},"chat":{"id":83441420,"first_name":"Koray","username":"Ybrin","type":"private"},"date":1492106189,"voice":{"duration":2,"mime_type":"audio/ogg","file_id":"AwADBAADagAD-Yh4Uzp0FgPcltErAg","file_size":6383}},"text":"/convertspeech","entities":[{"type":"bot_command","offset":0,"length":14}]}'

    class << self
      attr_reader :valid_message
    end
  end
end
