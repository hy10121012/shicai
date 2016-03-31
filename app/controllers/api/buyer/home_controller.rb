class Api::Buyer::HomeController < ApplicationController

  def find_home_category_items
    #获取主页大类项目
    cats  = Category.all.limit(7).order 'weight desc'

    render json: cats
  end

  def find_home_page_items
    #获取首页展示商品


  end





end
