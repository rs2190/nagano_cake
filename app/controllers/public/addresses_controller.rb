class Public::AddressesController < ApplicationController

  # [Add] 2023/03/04 配送先登録/一覧画面実装
  before_action :authenticate_customer!, only: [:index ,:edit]

  # 配送先登録/一覧画面
  def index

    @address = Address.new
    @addresses = Address.where(customer_id: current_customer.id)

  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
