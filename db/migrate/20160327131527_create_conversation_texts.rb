class CreateConversationTexts < ActiveRecord::Migration
  def change
    create_table :conversation_texts do |t|
      t.references :conversation, index: true
      t.text :content
      t.boolean :is_user_a_deleted
      t.boolean :is_user_b_deleted

      t.timestamps
    end
  end
end
