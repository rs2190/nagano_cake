class Admin::OrdersController < ApplicationController

  # [[Add] 2023/03/17 注文詳細画面 and 注文ステータスの更新実装
  before_action :authenticate_admin!

  # 注文詳細画面(ステータス編集を兼ねる)
  def show

    @order = order_find

  end

  # 注文ステータスの更新
  def update

    @order  = order_find
    @order.update(order_param)
    notice("注文ステータスを更新しました。")
    redirect_to admin_order_path

  end

  private

  #  ストロングパラメータ
  def order_param

    params.require(:order).permit(:order_status)

  end

end
