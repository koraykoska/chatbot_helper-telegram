require 'test_helper'
require 'fixtures/resources.rb'

class ChatbotHelper::ResourcesTest < Minitest::Test
  def setup
    @toolbox = ChatbotHelper::Telegram::Toolbox
    @fixtures = Fixtures::Resources
  end

  def test_message
    m = ChatbotHelper::Telegram::Message.new(string: @fixtures.valid_message)

    assert_equal 4, m.message_id
    assert_equal 1492106508, m.date
  end
end
