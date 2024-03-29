class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!

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

  # [Add] 2023/03/03 顧客の登録情報更新実装
  # 顧客の登録情報更新
  def update

    @customer = customer_find

    # customerモデルを更新
    if @customer.update(customer_params)

      # [Update & Fix] 2023/03/07 ①定数クラス仕様　②マイページ更新時 redirect to修正etc
      # 更新成功後、顧客のマイページへ遷移
      notice("あなたの登録情報を更新しました。")
      redirect_to my_page_path

    else

      render :edit

    end

  end

  # 顧客の退会確認画面
  def unsubscribe
  end

  # [Add] 2023/03/20 顧客の退会処理(ステータスの更新)実装
  # 顧客の退会処理(ステータスの更新)
  def goodbye

    @customer = customer_find
    @customer.update(is_deleted: true)
    # ログアウト
    reset_session

    notice("退会完了いたしました。またのご利用お待ちしております。")
    redirect_to root_path

  end


  private

  # ストロングパラメータ
  def customer_params

    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:email)

  end


end
