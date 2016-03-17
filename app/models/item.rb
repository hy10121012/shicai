class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :sub_cat
  belongs_to :payment
  belongs_to :brand

  def self.find_items_by_user_sub_cat(user_id,sub_cat_id)
    self.where("user_id=? and sub_cat_id=?",[user_id,sub_cat_id])

  end



end
