require 'test_helper'

class ChatbotHelper::ToolboxTest < Minitest::Test
  def setup
    @toolbox = ChatbotHelper::Telegram::Toolbox
  end

  def test_parse_json
    assert_equal({ 'test' => 'example' }, @toolbox.parse_json('{"test": "example"}'))
  end
end
