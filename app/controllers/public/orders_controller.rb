class Public::OrdersController < ApplicationController

  # [Add] 2023/03/10 注文情報入力画面(支払方法・配送先の選択)実装
  # 注文情報入力画面(支払方法・配送先の選択)
  def new

    @order = Order.new

  end

  def confirm
  end

  def thanks
  end

  def create
  end

  def index
  end

  def show
  end
end
