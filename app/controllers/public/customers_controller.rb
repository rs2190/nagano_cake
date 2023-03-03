class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!, only: [:show]

  # [Add] 2023/03/03 顧客のマイページ実装
  # 顧客のマイページ
  def show

    # [Add] 2023/03/03 customerモデル取得メソッド実装
    @customer = customer_find

  end

  # [Add] 2023/03/03 顧客の登録情報編集画面実装
  # 顧客の登録情報編集画面
  def edit

    @customer = customer_find

  end

  def update
  end

  def unsubscribe
  end

  def goodbye
  end
end
