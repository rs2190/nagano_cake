class Public::CartItemsController < ApplicationController

  # [Add] 2023/03/09 カート内商品データ追加・カート内商品一覧画面追加etc

  before_action :authenticate_customer!

  # カート内商品一覧画面(数量変更・カート削除の要素を含む)
  def index

    @cart_items = CartItem.where(customer_id: current_customer.id).order(id: "ASC")
    @total = 0

  end

  # [Add] 2023/03/09 カート内商品データ更新
  # カート内商品データ更新
  def update

    @cart_item = cart_item_find
    @cart_item.update(amount: cart_item_params[:amount].to_i)
    notice("対象商品の数量を変更しました。")
    redirect_to cart_items_path

  end

  # [Add] 2023/03/09 カート内商品データ削除(一商品)更新
  # カート内商品データ削除(一商品)
  def destroy

    cart_item = cart_item_find
    cart_item.destroy
    notice("対象商品を削除しました。")
    redirect_to cart_items_path

  end

  # [Add] 2023/03/09 カート内商品データ削除(全て)更新
  # カート内商品データ削除(全て)
  def destroy_all

    cart_items = CartItem.where(customer_id: current_customer.id)
    cart_items.destroy_all
    notice("カート内の商品を全て削除しました。")
    redirect_to cart_items_path

  end

  # カート内商品データ追加
  def create

    item_id = cart_item_params[:item_id]

    # 入力チェック
    if cart_item_params[:amount].to_i == 0

      alert("個数を選択してください。")
      redirect_to item_path(item_id)

    else
    # [Add] 2023/03/09 数量更新処理追加
    # カート内に、過去に商品した商品があるか？
    @Cart_Item = CartItem.find_by(customer_id: current_customer.id, item_id: item_id)

    if @Cart_Item

      # 既存データの数量
      update_amount = @Cart_Item.amount.to_i
      # 既存データの数量に、今回追加する数量と加算する。
      update_amount += cart_item_params[:amount].to_i

      # 加算した数量を更新
      @Cart_Item.update(amount: update_amount)

    else
      # 存在しない場合は、作成。
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save

    end

      notice("カートに対象商品を追加しました。")
      #更新登録成功時の遷移先
      redirect_to cart_items_path

    end

  end

  private

  # ストロングパラメータ
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
