class Admin::OrderDetailsController < ApplicationController

  # [Add] 2023/03/19 製作ステータスの更新実装
  before_action :authenticate_admin!

  # 製作ステータスの更新
  def update

    @orderdetail = OrderDetail.find(params[:id])
    @orderdetail.update(order_details_param)

    notice("対象商品の製作ステータスを更新しました。")
    redirect_to admin_order_path(@orderdetail.order_id)

  end

  #  ストロングパラメータ
  def order_details_param

    params.require(:order_detail).permit(:making_status)

  end


end
