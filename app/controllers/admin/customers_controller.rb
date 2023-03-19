class Admin::CustomersController < ApplicationController

  # [Add] 2023/03/07 顧客一覧画面実装
  before_action :authenticate_admin!, only: [:index, :edit]

  # 顧客一覧画面
  def index

    # [Update] 2023/03/19 レイアウトkaminari実装
    # @customers = Customer.all.order(id: "ASC")
     @customers = Customer.page(params[:page]).order(id: "ASC")

  end

  # [Add] 2023/03/07 顧客詳細画面実装
  # 顧客詳細画面
  def show

    # [Add] 2023/03/07 実装
    # @customer = Customer.find(params[:id])
    @customer = customer_find_params

  end

  # [Add] 2023/03/07 顧客編集画面実装
  # 顧客編集画面
  def edit

    @customer = customer_find_params

  end

  # [Add] 2023/03/07 顧客情報の更新実装
  # 顧客情報の更新
  def update

    @customer = customer_find_params

    # customerモデルを更新
    if @customer.update(customer_params)

      # 更新成功後、顧客詳細画面へ遷移
      redirect_to admin_customer_path(@customer.id)

    else

      render :edit

    end

  end

  private

  # ストロングパラメータ
  def customer_params

    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:email,:is_deleted)

  end

end
