class Admin::OrdersController < ApplicationController

  # [Add] 2023/03/07 顧客一覧画面実装
  before_action :authenticate_admin!

  # 注文詳細画面(ステータス編集を兼ねる)
  def show

    @order = order_find

  end

  def update
  end
end
