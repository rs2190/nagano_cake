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
      admin_home_top_path
    # Customers(ユーザー)
    when Customer then
      # 顧客のマイページ
      # [Update] 2023/03/01 顧客のマイページのrouting修正
      # show_customers_path
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




end
