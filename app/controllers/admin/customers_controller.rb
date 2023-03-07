class Admin::CustomersController < ApplicationController

  # [Add] 2023/03/07 顧客一覧画面実装
  before_action :authenticate_admin!, only: [:index, :edit]

  # 顧客一覧画面
  def index

    @customers = Customer.all.order(id: "ASC")

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

  def update
  end
end
