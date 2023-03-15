class Order < ApplicationRecord

  # [Add] 2023/03/10 customersとordersの 1 : N のアソシエーション実装
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  # [Add] 2023/02/26 orderモデルに支払方法のenum実装
  enum payment_method: { credit_card: 0, transfer: 1 }

  # [Add] 2023/02/26 orderモデルに注文ステータスのenum実装
  enum order_status: { waiting_for_payment: 0, deposit_confirmation: 1, in_production: 2, preparing_to_ship: 3, sent: 4 }

  # 定数クラス
  # config/initializers/constants.rb
  include Constants

  # 注文日
  def get_order_date

    created_at.strftime(DATE_FORMAT_2)

  end

  # 支払金額 (送料 + 請求額 + "円")
  def get_payment

    payment = postage + total_payment

    payment.to_s(:delimited) + "円"

  end

end
