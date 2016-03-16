class Category < ActiveRecord::Base

  def self.find_seller_category(user_id)
    find_by_sql ["SELECT c.id,c.name FROM categories c join sub_cats sc on sc.category_id=c.id join items i on i.sub_cat_id=sc.id WHERE i.user_id = ? group by c.id,c.name", user_id]
  end


end
