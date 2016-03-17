class Api::Seller::PriceController < ApplicationController
  def do_single_pricing
    item_id = params[:item_id]
    price = params[:price]
    item = Item.find(item_id)

    success = false
    if session[:user_id]  == item.user_id
      item.price = price
      success =item.save
    end
    render text: success
  end

  def do_batch_pricing
    sub_cat_id = params[:sub_cat_id]
    user_id = params[:user_id]
    rate = params[:rate]
    items = Item.find_items_by_user_sub_cat user_id,sub_cat_id

    items.each do |item|
      item.price = (item.price*(1+rate)).round(2)
    end
    items.save
  end

  def find_cat_item_prices
    user_id = params[:user_id]
    sub_cat_id = params[:sub_cat_id]
    items = Item.find_items_by_user_sub_cat user_id,sub_cat_id
    render json: items
  end
end
