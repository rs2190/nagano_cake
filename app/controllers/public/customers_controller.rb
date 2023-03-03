# "[Add] 2023/03/03 顧客のマイページ実装"
class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!, only: [:show]

  # 顧客のマイページ
  def show

    # [Add] 2023/03/03 customerモデル取得メソッド実装
    @customer = customer_find

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
