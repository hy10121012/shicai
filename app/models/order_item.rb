class OrderItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order,-> { where is_latest_version: true },:foreign_key => :order_entity_id, :primary_key => :entity_id
end
