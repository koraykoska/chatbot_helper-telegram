require 'test_helper'
require 'fixtures/resources.rb'

class ChatbotHelper::ResourcesTest < Minitest::Test
  def setup
    @toolbox = ChatbotHelper::Telegram::Toolbox
    @fixtures = Fixtures::Resources
  end

  def test_valid_message
    m = ChatbotHelper::Telegram::Message.new(string: @fixtures.valid_message)

    assert_equal 4, m.message_id
    assert_equal 1_492_106_508, m.date
  end

  def test_invalid_message
    assert_raises(ChatbotHelper::Exceptions::InvalidResource) do
      ChatbotHelper::Telegram::Message.new(string: @fixtures.invalid_message)
    end

    assert_raises(ChatbotHelper::Exceptions::InvalidResource) do
      ChatbotHelper::Telegram::Message.new(string:
                                           @fixtures.inner_invalid_message)
    end
  end
end
