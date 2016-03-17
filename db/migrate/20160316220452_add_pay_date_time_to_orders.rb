class AddPayDateTimeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :pay_date_time, :integer
  end
end
