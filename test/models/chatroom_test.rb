require 'test_helper'

class ChatroomTest < ActiveSupport::TestCase
  def setup
    @chatroom = Chatroom.new(topic: 'FooBar')
  end
  test "should be valid" do
    assert @chatroom.valid?
  end
  test "topic should be present" do
    @chatroom.topic = "     "
    assert_not @chatroom.valid?
  end

  test "topic should be unique" do
    duplicate_chatroom = @chatroom.dup
    duplicate_chatroom.topic = @chatroom.topic.upcase
    @chatroom.save
    assert_not duplicate_chatroom.valid?
  end

end
