class Buyer::CartController < ApplicationController
  layout 'layout_buyer'

  def index
    if !params[:address_id].nil?
      @addressi_id = params[:address_id]
    else
      @addressi_id = 0
    end

    @title='购物车'
    @date_str =(Time.now+1.day).strftime("%Y/%m/%d").to_s
  end
end
