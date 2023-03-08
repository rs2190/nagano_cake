class Admin::ItemsController < ApplicationController

   # [Add] 2023/03/08 商品新規登録画面実装
  before_action :authenticate_admin!, only: [:index, :new, :show, :edit]


  def index
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

  def show
  end

  def edit
  end

  def update
  end

  private

  # ストロングパラメータ
  def item_param

    params.require(:item).permit(:image, :genre_id, :name, :introduction, :price ,:is_active)

  end

end
