class Public::OrdersController < ApplicationController

  # [Add] 2023/03/10 注文情報入力画面(支払方法・配送先の選択)実装
  # 注文情報入力画面(支払方法・配送先の選択)
  def new

    @order = Order.new

  end

  # [Add] 2023/03/11 注文情報確認画面実装
  # 注文情報確認画面
  def confirm

    check_adress(params[:order][:select_address])
    @total = 0
    @postage = 800


  end

  def thanks
  end

  # [Add] 2023/03/12 注文確定処理実装
  # 注文確定処理
  def create

    create_order
    redirect_to thanks_path

  end

  def index
  end

  def show
  end

  private

  # ストロングパラメータ
  def order_params

    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage, :total_payment)

  end

  # お届け先分岐条件処理
  def check_adress(select_address)

    # お届け先 = ご自身の住所 の場合
    if select_address == "0"

      # 登録しているcustomerモデルを取得。
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.name

    # お届け先 = 登録済住所から選択 の場合
    elsif select_address == "1"

      # 登録しているaddressモデルを取得。
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    # お届け先 = 新しいお届け先 の場合
    elsif select_address == "2"

      # 注文情報入力画面で入力した内容を反映
      @order = Order.new(order_params)

    else

      render :new

    end

  end

  # orderモデル生成
  def create_order

    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    # orderモデル生成後の注文IDを渡す
    create_order_details(@order.id)

  end

  # order_detailモデル生成
  def create_order_details(order_id)

    @cartitems = CartItem.where(customer_id: current_customer.id).order(id: "ASC")

    @cartitems.each do |cart_item|

      order_detail = OrderDetail.new

      # 注文ID
      order_detail.order_id = order_id
      # 商品ID
      order_detail.item_id = cart_item.item_id
      # 単価（税込）
      order_detail.price = cart_item.item.price
      # 数量
      order_detail.amount = cart_item.amount

      order_detail.save

    end

    destroy_all_cart_items(@cartitems)

  end

  # cart_itemモデル削除
  def destroy_all_cart_items(cartitems)

    cartitems.destroy_all

  end

end
