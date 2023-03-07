class Admin::CustomersController < ApplicationController

  # [Add] 2023/03/07 顧客一覧画面実装
  before_action :authenticate_admin!, only: [:index, :edit]

  # 顧客一覧画面
  def index

    @customers = Customer.all.order(id: "ASC")

  end

  def show
  end

  def edit
  end

  def update
  end
end
