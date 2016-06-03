class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user, index: true
      t.string :address1
      t.integer :street_id
      t.integer :district_id
      t.integer :city_id
      t.integer :province_id
      t.integer :postcode
      t.boolean :is_default
      t.integer :telephone

      t.timestamps
    end
  end
end
