class Api::Buyer::HomeController < ApplicationController

  def find_home_category_items
    #获取主页大类项目
    cats  = Category.all.limit(7).order 'weight desc'

    render json: cats
  end

  def find_ads_items
    #获取首页展示商品
    records = Promotion.eager_load(:item).all.order "weight desc"
    return_map = []
    records.each do |record|
      attr  = record.item.attributes
      pic = ItemPicture.find_by :item_id=>record.item.id, :is_profile=>true

      if !pic.nil?
        attr[:pic] = pic.picture_s_url
      else
        attr[:pic] = "/img/buyer/cat/default.jpg"
      end
      attr[:unit] = Unit.find_unit_by_item_id record.item.unit_id

      return_map.push(attr)
    end

    render json: return_map
  end





end
