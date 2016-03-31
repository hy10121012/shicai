class Conversation < ActiveRecord::Base
  has_many :conversation_texts
  belongs_to :user_a, :class_name => 'User', :foreign_key => 'user_a_id'
  belongs_to :user_b, :class_name => 'User', :foreign_key => 'user_b_id'

  def self.upsert_conversation user_1_id, user_2_id,curr_user_id
    user_a_id, user_b_id = sort_user_ids user_1_id, user_2_id
    conv = find_by :user_a_id => user_a_id, :user_b_id => user_b_id
    if conv.nil?
      conv = Conversation.new :user_a_id => user_a_id, :user_b_id => user_b_id
      if user_a_id==curr_user_id
        conv.is_user_a_unread = false
        conv.is_user_b_unread = true
      else
        conv.is_user_a_unread = true
        conv.is_user_b_unread = false
      end
    else
      if user_a_id==curr_user_id
        conv.is_user_b_unread = true
      else
        conv.is_user_a_unread = true
      end
      conv.updated_at = Time.now
    end

    conv.save
    return conv.id
  end


  def self.find_conversations user_id, offset=0
    where('user_a_id=? or user_b_id=?', user_id,user_id).order('updated_at desc').limit(10).offset(offset)
  end

  def self.send_message sender_id, receiver_id, content ,curr_user_id
    self.transaction do
      conv_id = upsert_conversation sender_id, receiver_id ,curr_user_id
      conv_text = ConversationText.new :conversation_id => conv_id, :content => content, :user_id => sender_id, :is_user_a_deleted => false, :is_user_b_deleted => false
      conv_text.save
      return true
    end
    return false
  end

  private
  def self.sort_user_ids id1, id2
    if id1>=id2
      return id2, id1
    else
      return id1, id2
    end
  end
end
