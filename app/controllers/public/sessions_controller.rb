# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

  # before_action :configure_sign_in_params, only: [:create]
  before_action :customer_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # サインインの処理
  def after_sign_in_path_for(resource)

    notice("ログイン完了しました。こんにちは！本日もよろしくお願いいたします。")
    root_path

  end

  protected

  # 退会しているかを判断するメソッド
  def customer_state
      ## 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer

    ## 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted
      ##  trueだった場合、退会しているのでサインアップ画面に遷移する
      alert("入力したメールアドレスは、退会しているため新規登録をお願いいたします。")
      redirect_to new_customer_registration_path
    end

  end


end
