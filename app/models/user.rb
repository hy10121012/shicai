class User < ActiveRecord::Base
  has_secure_token
  belongs_to :city


  def self.get_user_login(user_id, pw)
    user = find_user(user_id)
    unless user.nil?
      if user.pw == Digest::MD5.hexdigest(pw)
        return user
      end
      return false
    end
    nil
  end

  def self.find_user(user_id)
    self.where("email='#{user_id}'or phone='#{user_id}'").first
  end


end
