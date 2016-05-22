class Api::Buyer::HomeController < ApplicationController

  def find_home_category_items
    #获取主页大类项目
    cats  = Category.all.limit(7).order 'weight desc'

    render json: cats
  end

  def find_ads_items
    #获取首页展示商品
    items = Item.all.limit(10)
    return_map = []
    items.each do |item|
      attr  = item.attributes
      if !item.profile_pic.nil?
        attr[:pic] = item.profile_pic.picture_s_url
      else
        attr[:pic] = "/img/buyer/cat/default.jpg"
      end
      return_map.push(attr)
    end

    render json: return_map
  end





end
