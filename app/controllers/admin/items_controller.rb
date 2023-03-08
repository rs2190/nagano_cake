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

  def create
  end

  def show
  end

  def edit
  end

  def update
  end
end
