module Fixtures
  module Resources
    # A valid message
    @valid_message = '{"message_id":4,"from":{"id":83441420,"first_name":"Koray","username":"Ybrin"},"chat":{"id":83441420,"first_name":"Koray","username":"Ybrin","type":"private"},"date":1492106508,"reply_to_message":{"message_id":2,"from":{"id":83441420,"first_name":"Koray","username":"Ybrin"},"chat":{"id":83441420,"first_name":"Koray","username":"Ybrin","type":"private"},"date":1492106189,"voice":{"duration":2,"mime_type":"audio/ogg","file_id":"AwADBAADagAD-Yh4Uzp0FgPcltErAg","file_size":6383}},"text":"/convertspeech","entities":[{"type":"bot_command","offset":0,"length":14}]}'

    # Invalid message: message_id missing
    @invalid_message = '{"from":{"id":83441420,"first_name":"Koray","username":"Ybrin"},"chat":{"id":83441420,"first_name":"Koray","username":"Ybrin","type":"private"},"date":1492106508,"reply_to_message":{"message_id":2,"from":{"id":83441420,"first_name":"Koray","username":"Ybrin"},"chat":{"id":83441420,"first_name":"Koray","username":"Ybrin","type":"private"},"date":1492106189,"voice":{"duration":2,"mime_type":"audio/ogg","file_id":"AwADBAADagAD-Yh4Uzp0FgPcltErAg","file_size":6383}},"text":"/convertspeech","entities":[{"type":"bot_command","offset":0,"length":14}]}'

    # Inner invalid message: required object chat: id missing
    @inner_invalid_message = '{"message_id":4,"from":{"id":83441420,"first_name":"Koray","username":"Ybrin"},"chat":{"first_name":"Koray","username":"Ybrin","type":"private"},"date":1492106508,"reply_to_message":{"message_id":2,"from":{"id":83441420,"first_name":"Koray","username":"Ybrin"},"chat":{"id":83441420,"first_name":"Koray","username":"Ybrin","type":"private"},"date":1492106189,"voice":{"duration":2,"mime_type":"audio/ogg","file_id":"AwADBAADagAD-Yh4Uzp0FgPcltErAg","file_size":6383}},"text":"/convertspeech","entities":[{"type":"bot_command","offset":0,"length":14}]}'

    # A valid update
    @valid_update = '{"update_id":940972365,"message":{"message_id":3,"from":{"id":83441420,"first_name":"Koray","username":"Ybrin"},"chat":{"id":83441420,"first_name":"Koray","username":"Ybrin","type":"private"},"date":1492106483,"text":"/convertspeech","entities":[{"type":"bot_command","offset":0,"length":14}]}}'

    # A valid UserProfilePhotos resource
    @valid_user_profile_photos = '{"total_count":4,"photos":[[{"file_id":"AgADBAADL6gxGzrGKQTq9SNqeUsKwQrvnxkABLIihbnSWE6RUJgCAAEC","file_size":8067,"width":160,"height":160},{"file_id":"AgADBAADL6gxGzrGKQTq9SNqeUsKwQrvnxkABOhzLDgBklkgUZgCAAEC","file_size":24168,"width":320,"height":320},{"file_id":"AgADBAADL6gxGzrGKQTq9SNqeUsKwQrvnxkABExTxd3uNapUUpgCAAEC","file_size":71474,"width":640,"height":640}],[{"file_id":"AgADBAADLagxGzrGKQRDCJDJDYwtrzKlZxkABEc-cX8B3Fxg9JoEAAEC","file_size":7783,"width":160,"height":160},{"file_id":"AgADBAADLagxGzrGKQRDCJDJDYwtrzKlZxkABIesA_C6y7nw9ZoEAAEC","file_size":24100,"width":320,"height":320},{"file_id":"AgADBAADLagxGzrGKQRDCJDJDYwtrzKlZxkABLWJ-oMvaXbP9poEAAEC","file_size":74426,"width":640,"height":640}],[{"file_id":"AgADBAADGagxGzrGKQQfzB5ye8g6zbiiZxkABHUKsHVFp5dQeuYDAAEC","file_size":10969,"width":160,"height":160},{"file_id":"AgADBAADGagxGzrGKQQfzB5ye8g6zbiiZxkABIi4vQtQe_HLe-YDAAEC","file_size":33168,"width":320,"height":320},{"file_id":"AgADBAADGagxGzrGKQQfzB5ye8g6zbiiZxkABOzieMUByFD9fOYDAAEC","file_size":96963,"width":640,"height":640}],[{"file_id":"AgADBAADq6cxGzrGKQR_bUp3rq6UxZO1YTAABIn71DzcOZ-lU5QAAgI","file_size":10184,"width":160,"height":160},{"file_id":"AgADBAADq6cxGzrGKQR_bUp3rq6UxZO1YTAABMLZEVSL83iJVJQAAgI","file_size":30423,"width":320,"height":320},{"file_id":"AgADBAADq6cxGzrGKQR_bUp3rq6UxZO1YTAABAaRzVQDbl0PVZQAAgI","file_size":86805,"width":640,"height":640},{"file_id":"AgADBAADq6cxGzrGKQR_bUp3rq6UxZO1YTAABNklzg6BTSJwVpQAAgI","file_size":83292,"width":800,"height":800}]]}'

    class << self
      attr_reader :valid_message, :invalid_message, :inner_invalid_message
      attr_reader :valid_update
      attr_reader :valid_user_profile_photos
    end
  end
end
