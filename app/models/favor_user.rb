class FavorUser < ActiveRecord::Base

  def self.find_favor_user user_id
    find_by_sql ["select u.* from favor_users f join users u on u.id = f.user_id where f.user_id=?",user_id]
  end


end
