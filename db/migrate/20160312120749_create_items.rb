class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.text :description
      t.references :user, index: true
      t.references :sub_cat, index: true
      t.references :payment, index: true
      t.references :brand, index: true

      t.timestamps
    end
  end
end
