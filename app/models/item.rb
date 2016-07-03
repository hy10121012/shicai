class Item < ActiveRecord::Base
  searchable do
    text :name => 2
    text :description
  end


  attr_accessor :pic
  attr_reader :pic
  belongs_to :user
  belongs_to :sub_cat
  belongs_to :payment
  belongs_to :brand
  has_one :profile_pic, -> { where is_profile: true }, :class_name => 'ItemPicture'

  def self.find_items_by_user_sub_cat(user_id, sub_cat_id)
    self.where("user_id=? and sub_cat_id=?", user_id, sub_cat_id)
  end

  def self.find_items_by_user(user_id)
    self.where("user_id=? ", user_id).joins("left join item_pictures on item_pictures.item_id=items.id and item_pictures.is_profile=1")
  end

  def self.find_frequent_item(user_id, cat_id)
    find_by_sql ["select i.*,oi.item_id,count(oi.order_entity_id) total from orders o left join order_items oi on o.entity_id=oi.order_entity_id and o.is_latest_version=1 join items i on i.id=oi.item_id join sub_cats sc on sc.id= i.sub_cat_id where sc.category_id=? and o.user_id=? group by oi.item_id order by total desc", cat_id.to_i, user_id]
  end


  def self.get_item_pic item
    if !item.profile_pic.nil?
      item.profile_pic.picture_s_url
    else
      "/img/buyer/cat/default.jpg"
    end

  end

end
