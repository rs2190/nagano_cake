class Public::ItemsController < ApplicationController

  # 商品一覧画面
  def index

    @genres = genre_all_asc

    # issue タグ検索未実装
    if params[:id].present?

      @items = Item.where(genre_id: params[:id]).order(id: "DESC")

    else

      @items = Item.all.order(id: "DESC")

    end


  end

  def show

    @genres = genre_all_asc
    @item = item_find
    @cart_item = CartItem.new


  end
end
