class SubCat < ActiveRecord::Base
  belongs_to :category

  def self.find_all_sub_cats_by_sub_cat_id sub_cat_id
    find_by_sql ["select * from sub_cats where category_id = (select category_id from sub_cats where id=?)",sub_cat_id]

  end


end
