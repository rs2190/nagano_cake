class Public::AddressesController < ApplicationController

  # [Add] 2023/03/04 配送先登録/一覧画面実装
  before_action :authenticate_customer!, only: [:index ,:edit]

  # 配送先登録/一覧画面
  def index

    @address = Address.new
    @addresses = Address.where(customer_id: current_customer.id)

  end

  # [Add] 2023/03/05 配送先編集画面実装
  # 配送先編集画面
  def edit

    # [Add] 2023/03/05 addressモデル取得メソッド実装
    # @address = Address.find(params[:id])
    @address = address_find

  end

  # [Add] 2023/03/04 配送先の登録実装
  # 配送先の登録
  def create

    # データを受け取り新規登録するためのインスタンス作成
    @address = Address.new(address_params)
    # Addressモデル.会員ID = ログインしたログインした顧客のid
    @address.customer_id = current_customer.id

    # 登録時チェック
    if @address.save

      # 成功時
      redirect_to addresses_path

    else

      @addresses = Address.where(customer_id: current_customer.id)
      render :index
    end

  end

  # [Add] 2023/03/05 配送先の更新実装
  # 配送先の更新
  def update

    @address = address_find

    if @address.update(address_params)

      # 成功時
      redirect_to addresses_path
    else

      render :edit

    end

  end

  def destroy
  end

  private

  # ストロングパラメータ
  def address_params

    params.require(:address).permit(:name,:postal_code,:address)

  end


end
