class ApplicationController < ActionController::Base

  # [Add] 2023/03/02 顧客の会員登録画面からCustomerモデルへ登録可能

  before_action :configure_permitted_parameters, if: :devise_controller?

  # サインイン後の遷移
  def after_sign_in_path_for(resource)

    # 登録したモデル
    case resource
    # Admins(管理者)
    when Admin then
      # 管理者トップページ(注文履歴一覧)
      notice("お疲れ様です!　本日も一日頑張りましょう。")
      admin_home_top_path
    # Customers(ユーザー)
    when Customer then
      # 顧客のマイページ
      # [Update] 2023/03/01 顧客のマイページのrouting修正
      # show_customers_path
      notice("ようこそ!　ここがあなたのマイページです。")
      my_page_path
    end
  end

  protected

  # deviseのストロングパラメータ。
  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(
      :sign_up,
        keys: [
          :last_name,
          :first_name,
          :last_name_kana,
          :first_name_kana,
          :email,
          :encrypted_password,
          :postal_code,
          :address,
          :telephone_number
        ]
    )

  end

  # [Add] 2023/03/03 customerモデル取得メソッド実装
  public

  # customerモデルを、ログインした顧客のid（current_customer）で取得する。
  def customer_find

    Customer.find(current_customer.id)

  end

  # customerモデルを、リクエストパラメータで送られてきた会員idで取得する。
  def customer_find_params

    Customer.find(params[:id])

  end

  # [Add] 2023/03/05 addressモデル取得メソッド実装
  # addressモデルを、リクエストパラメータで送られてきた配送先情報idで取得する。
  def address_find

    Address.find(params[:id])

  end

  # [Add] 2023/03/06 genreモデル取得メソッド実装
  # genreモデルを、リクエストパラメータで送られてきたジャンルidで取得する。
  def genre_find

     Genre.find(params[:id])

  end

  # [Add] 2023/03/09 genreモデル全件取得メソッド実装
  # genreモデルを全件取得（昇順）。
  def genre_all_asc

    Genre.all.order(id: "ASC")
  end

  # [Add] 2023/03/08 itemモデル取得メソッド実装
  # itemモデルを、リクエストパラメータで送られてきた商品idで取得する。
  def item_find

    Item.find(params[:id])

  end

  # [Add] 2023/03/09 itemモデル取得メソッド実装
  # itemモデルを、リクエストパラメータで送られてきた商品idで取得する。
  def cart_item_find

    CartItem.find(params[:id])

  end

  # [Add] 2023/03/15 orderモデル取得メソッド実装
  # Orderモデルを、リクエストパラメータで送られてきた商品idで取得する。
  def order_find

    Order.find(params[:id])

  end

  # フラッシュメッセージを定義(正常)
  def notice(word)

    flash[:notice] = word

  end

  # フラッシュメッセージを定義（異常）
  def alert(word)

    flash[:alert] = word

  end


end
