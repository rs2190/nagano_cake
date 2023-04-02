class Admin::OrderDetailsController < ApplicationController

  # [Add] 2023/03/19 製作ステータスの更新実装
  before_action :authenticate_admin!

  # 製作ステータスの更新
  def update

    @orderdetail = OrderDetail.find(params[:id])
    @orderdetail.update(order_details_param)

    notice("対象商品の製作ステータスを更新しました。")

    case @orderdetail.making_status

    when "in_production"

      order = Order.find(params[:order_id])

      if order.order_status != "in_production"
        order.update(order_status: "in_production")
        notice2("注文ステータスを製作中に更新しました。")
      end

    when "completion_of_production"

      order = Order.find(params[:order_id])
      order_details = order.order_details.all
      is_updated = true
      order_details.each do  |order_detail|

        if order_detail.making_status != "completion_of_production"
          is_updated = false
        end

      end

      if is_updated == true
          order.update(order_status: "preparing_to_ship")
          notice2("注文ステータスを発送準備中に更新しました。")
      end
    end

    notice("対象商品の製作ステータスを更新しました。")
    redirect_to admin_order_path(@orderdetail.order_id)

  end

  #  ストロングパラメータ
  def order_details_param

    params.require(:order_detail).permit(:making_status)

  end


end
