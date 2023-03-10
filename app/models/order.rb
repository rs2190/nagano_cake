class Order < ApplicationRecord

  # [Add] 2023/03/10 customersとordersの 1 : N のアソシエーション実装
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  # [Add] 2023/02/26 orderモデルに支払方法のenum実装
  enum payment_method: { credit_card: 0, transfer: 1 }

  # [Add] 2023/02/26 orderモデルに注文ステータスのenum実装
  enum order_status: { waiting_for_payment: 0, deposit_confirmation: 1, in_production: 2, preparing_to_ship: 3, sent: 4 }


end
