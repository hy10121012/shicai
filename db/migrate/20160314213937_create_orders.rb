class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :buyer_user_id
      t.text :delivery_address
      t.integer :delivery_date_time
      t.integer :order_taken_date_time
      t.text :comment
      t.references :user, index: true

      t.timestamps
    end
  end
end
