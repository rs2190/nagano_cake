class Public::CartItemsController < ApplicationController

  # [Add] 2023/03/09 カート内商品データ追加・カート内商品一覧画面追加etc

  before_action :authenticate_customer!

  # カート内商品一覧画面(数量変更・カート削除の要素を含む)
  def index

    @cart_items = CartItem.where(customer_id: current_customer.id).order(id: "ASC")
    @total = 0

  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  # カート内商品データ追加
  def create

    chack = false

    if CartItem.find_by(customer_id: current_customer.id, item_id: cart_item_params[:item_id])

    else

      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id

      if @cart_item.save

        chack = true

      end

    end

    if chack
      redirect_to cart_items_path
    else
      render :'public/items#show'
    end
  end

  private

  # ストロングパラメータ
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
