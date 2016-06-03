class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items, through: :order_item

  def self.find_customer_summary_by_user_id user_id
    find_by_sql ["select user_id,sum(quantity) quantity,sum(amount) amount from orders where user_id=? group by user_id",user_id]
  end

  def self.find_order_by_date_range user_id, start_date
    where("created_at>? and user_id=? ",start_date,user_id)
  end

  def self.find_payable_amount user_id
    amount = find_by_sql ["select sum(amount) amount from orders where user_id=? and status='PAYABLE' ",user_id]
    amount['amount']
  end

  def self.find_order_count_by_status user_id, status
    rs = find_by_sql ["select count(id) count from orders where user_id=? and status=?",user_id,status]
    rs[0]['count']
  end

  def self.find_tmr_order user_id, date
    find_by_sql ["select * from orders where delivery_date_time =? and user_id=?",date,user_id]
  end

  def self.find_order_counts user_id
    rs = find_by_sql ["select status,count(id) count from orders where user_id=? group by status",user_id]
    map = {}
    rs.each do |record|
      map[record['status']] = record['count']
    end
    map[OrderStatus::PAYABLE.to_s] =0 if map[OrderStatus::PAYABLE.to_s].nil?
    map[OrderStatus::TO_COMMENT.to_s] =0 if map[OrderStatus::TO_COMMENT.to_s].nil?
    map[OrderStatus::TO_DELIVER.to_s] =0 if map[OrderStatus::TO_DELIVER.to_s].nil?
    map[OrderStatus::DELIVERED.to_s] =0 if map[OrderStatus::DELIVERED.to_s].nil?
    map[OrderStatus::COMPLETED.to_s] =0 if map[OrderStatus::COMPLETED.to_s].nil?
    map[OrderStatus::CANCELLED.to_s] =0 if map[OrderStatus::CANCELLED.to_s].nil?
    map[OrderStatus::COMPLAIN.to_s] =0 if map[OrderStatus::COMPLAIN.to_s].nil?
    map[OrderStatus::REFUND_PENDING.to_s] =0 if map[OrderStatus::REFUND_PENDING.to_s].nil?
    map[OrderStatus::REFUNDED.to_s] =0 if map[OrderStatus::REFUNDED.to_s].nil?
    return map

  end


end
