class Buyer::HomeController < ApplicationController
  layout 'layout_buyer'

  def index

  end

  def search
    @title = '搜索结果'
    @query = Item.search do
      fulltext params[:search]
    end
    items = @query.results
    @items = []
    items.each do |item|
      attr  = item.attributes
      pic = ItemPicture.find_by :item_id=>item.id, :is_profile=>true
      if !pic.nil?
        attr['pic'] = pic.picture_s_url
      else
        attr['pic'] = "/img/buyer/cat/default.jpg"
      end
      @items.push(attr)
    end
    puts @items.to_yaml
  end

end



