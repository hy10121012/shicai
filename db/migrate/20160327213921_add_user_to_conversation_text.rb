class AddUserToConversationText < ActiveRecord::Migration
  def change
    add_column :conversation_texts, :user_id, :integer
  end
end
