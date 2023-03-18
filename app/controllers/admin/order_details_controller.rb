class Admin::OrderDetailsController < ApplicationController

  # [[Add] 2023/03/17 注文詳細画面 and 注文ステータスの更新実装
  before_action :authenticate_admin!

  # 製作ステータスの更新
  def update

    @orderdetail = OrderDetail.find(params[:id])

  end

  #  ストロングパラメータ
  def order_details_param

    params.require(:order_detail).permit(:making_status)

  end


end
