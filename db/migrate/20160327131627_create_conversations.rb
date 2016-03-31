class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :user_a_id
      t.integer :user_b_id
      t.boolean :is_user_a_unread
      t.boolean :is_user_b_unread

      t.timestamps
    end
  end
end
