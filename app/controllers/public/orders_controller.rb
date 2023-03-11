class Public::OrdersController < ApplicationController

  # [Add] 2023/03/10 注文情報入力画面(支払方法・配送先の選択)実装
  # 注文情報入力画面(支払方法・配送先の選択)
  def new

    @order = Order.new

  end

  def confirm

    check_adress(params[:order][:select_address])
    @total = 0
    @postage = 800


  end

  def thanks
  end

  def create
  end

  def index
  end

  def show
  end

  private

  # ストロングパラメータ
  def order_params

    params.require(:order).permit(:payment_method, :postal_code, :address, :name)

  end

  def check_adress(select_address)

    if select_address == "0"

      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.name

    elsif select_address == "1"

      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name


    elsif select_address == "2"

      @order = Order.new(order_params)

    else

      render :new

    end


  end

end
