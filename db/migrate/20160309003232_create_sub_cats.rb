class CreateSubCats < ActiveRecord::Migration
  def change
    create_table :sub_cats do |t|
      t.string :name
      t.references :category, index: true

      t.timestamps
    end
  end
end
