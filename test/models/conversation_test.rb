require 'test_helper'

class ConversationTest < ActiveSupport::TestCase
  test "send a message existing" do
    rs = Conversation.send_message 10, 1, "test message" ,10
    assert rs==true
    convs = Conversation.find_by :user_a_id=>1,:user_b_id=>10

    assert convs.user_a_id==1
    assert convs.user_b_id==10
    assert convs.is_user_a_unread==true;
    assert convs.is_user_b_unread==false;
  end

  test "send a message new" do
    rs = Conversation.send_message 12, 7, "test message" ,10
    assert rs==true
    convs = Conversation.find_conversations 12
    assert convs.size==1
    conv = convs[0]
    assert conv.user_a_id==7
    assert conv.user_b_id==12
    assert conv.is_user_a_unread==true;
    assert conv.is_user_b_unread==false;

  end
end
