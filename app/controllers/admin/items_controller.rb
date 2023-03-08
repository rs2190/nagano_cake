class Admin::ItemsController < ApplicationController

   # [Add] 2023/03/08 商品新規登録画面実装
  before_action :authenticate_admin!, only: [:index, :new, :show, :edit]

  # [Add] 2023/03/08 商品一覧画面実装
  # 商品一覧
  def index

    @items = Item.all.order(id: "ASC")

  end

  # [Add] 2023/03/08 商品新規登録画面実装
  # 商品新規登録画面
  def new

    @item = Item.new

  end

  # [Add] 2023/03/08 商品情報の新規登録実装
  # 商品情報の新規登録
  def create

    @item = Item.new(item_param)


    if @item.save

      redirect_to admin_items_path

    else

      render :new

    end


  end

  # [Add] 2023/03/08 商品詳細画面実装etc
  # 商品詳細画面
  def show

    @item = item_find

  end

  # [Add] 2023/03/08 商品編集画面実装
  # 商品編集画面
  def edit

    @item = item_find

  end

  # [Add] 2023/03/08 商品情報の更新実装
  # 商品情報の更新
  def update

    @item = item_find

    if @item.update(item_param)

      redirect_to admin_items_path

    else

      render :edit

    end

  end

  private

  # ストロングパラメータ
  def item_param

    params.require(:item).permit(:image, :genre_id, :name, :introduction, :price ,:is_active)

  end

end
