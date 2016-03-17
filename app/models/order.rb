class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items, through: :order_item

  def self.find_customer_summary_by_user_id user_id
    find_by_sql ["select buyer_user_id,sum(quantity) quantity,sum(amount) amount from orders where user_id=? group by buyer_user_id",user_id]
  end

  def self.find_order_by_date_range user_id, start_date
    where("created_at>? and user_id=? ",start_date,user_id)
  end

  def self.find_payable_amount user_id
    amount = find_by_sql ["select sum(amount) amount from orders where user_id=? and status='PAYABLE' ",user_id]
    amount['amount']
  end

end
