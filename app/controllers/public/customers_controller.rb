# "[Add] 2023/03/03 顧客のマイページ実装"
class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!, only: [:show]

  # 顧客のマイページ
  def show

    @customer = Customer.find(current_customer.id)

  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def goodbye
  end
end
