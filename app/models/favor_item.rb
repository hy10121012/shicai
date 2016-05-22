class FavorItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  def self.find_favor_item user_id
    find_by_sql ["select i.* from favor_items f join items i on i.id = f.item_id where f.user_id=?",user_id]
  end




end
