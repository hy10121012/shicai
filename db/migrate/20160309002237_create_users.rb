class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :pw
      t.string :phone
      t.string :address1
      t.string :address2
      t.integer :postcode
      t.references :city, index: true
      t.integer :user_type

      t.timestamps
    end
  end
end
