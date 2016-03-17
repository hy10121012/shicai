class Api::Seller::FianceManagementController < ApplicationController
  def find_finance_summary
    user_id=session[:user_id]
    date = beginning_of_month()
    orders = Order.find_order_by_date_range user_id, date
    return_map = {'overall'=>UserFinance.find_by user_id: user_id,'monthly'=>[],'client'=>[]}

    orders.each do |order|
      if order.status == OrderStatus::COMPLETED
        return_map['overall']['month']+=order.amount
      end

    end

  end
end
