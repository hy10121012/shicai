class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :pw
      t.number :phone
      t.string :address1
      t.string :address2
      t.number :postcode
      t.references :city, index: true
      t.boolean :type

      t.timestamps
    end
  end
end
