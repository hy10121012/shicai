class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :user, index: true
      t.references :item, index: true
      t.integer :quantity
      t.integer :delivery_date_time

      t.timestamps
    end
  end
end
