class CreateApiBuyerCarts < ActiveRecord::Migration
  def change
    create_table :api_buyer_carts do |t|
      t.references :user, index: true
      t.references :item, index: true
      t.integer :quantity
      t.integer :delivery_date_time

      t.timestamps
    end
  end
end
