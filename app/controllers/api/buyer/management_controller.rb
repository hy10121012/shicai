class Api::Buyer::ManagementController < ApplicationController
  def find_favor_sellers
    #获取收藏卖家
    users = FavorUser.find_favor_user session[:user_id]
    render json: users

  end

  def find_favor_items
    #获取收藏单品
    items = FavorItem.find_favor_item session[:user_id]
    render json: items
  end

  def find_frequent_item
    #获取常用物品清单



  end

  def remove_favor_seller
    #移除收藏卖家
    record = FavorUser.find_by :user_id => session[:user_id], :favor_id => params[:id]
    record.delete
  end

  def remove_favor_item
    #移除收藏清单
    rd = FavorItem.find_by :user_id => session[:user_id], :item_id => params[:id]
    rd.delete
  end
end
