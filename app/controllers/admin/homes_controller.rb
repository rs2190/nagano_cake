class Admin::HomesController < ApplicationController

  before_action :authenticate_admin!
  
  # [Add] 2023/03/16 管理者トップページ(注文履歴一覧)実装
  # 管理者トップページ(注文履歴一覧)
  def top

    @orders = Order.all.order(id: "DESC")

  end
end
