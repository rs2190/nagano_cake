class Public::ItemsController < ApplicationController

  # [Add] 2023/03/09 商品一覧画面追加etc
  # 商品一覧画面
  def index

    @genres = genre_all_asc

    # issue タグ検索未実装
    if params[:id].present?

      @items = Item.where(genre_id: params[:id]).order(id: "DESC")

    else

      # [Update] 2023/03/19 レイアウトkaminari実装
      # @items = Item.all.order(id: "DESC")
      @items = Item.page(params[:page]).per(8).order(id: "DESC")

    end


  end

  # [Add] 2023/03/09 商品詳細画面追加
  # 商品詳細
  def show

    @genres = genre_all_asc
    @item = item_find
    @cart_item = CartItem.new


  end
end
