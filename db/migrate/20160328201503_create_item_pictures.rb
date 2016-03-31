class CreateItemPictures < ActiveRecord::Migration
  def change
    create_table :item_pictures do |t|
      t.references :item, index: true
      t.string :picture_l_url
      t.string :picture_s_url
      t.boolean :is_profile

      t.timestamps
    end
  end
end
