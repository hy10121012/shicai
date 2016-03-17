class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user, index: true
      t.string :address1
      t.string :address2
      t.string :district
      t.string :city
      t.string :provence
      t.integer :postcode
      t.boolean :is_default
      t.integer :telephone

      t.timestamps
    end
  end
end
