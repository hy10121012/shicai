class CreateFavorUsers < ActiveRecord::Migration
  def change
    create_table :favor_users do |t|
      t.integer :user_id
      t.integer :favor_id

      t.timestamps
    end
  end
end
