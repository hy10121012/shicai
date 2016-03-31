
class Api::Seller::FinanceManagementController < ApplicationController
  def find_finance_summary
    user_id=session[:user_id]
    date = DateTime.now.beginning_of_month
    orders = Order.find_order_by_date_range user_id, date
    fin_stats = UserFinance.find_by user_id: user_id;
    return_map = {'overall'=>fin_stats,'monthly'=>[],'clients'=>[]}

    orders.each do |order|
      if order.status == OrderStatus::COMPLETED
        return_map['overall']['month']+=order.amount
      end

    end

    render json: return_map
  end
end
