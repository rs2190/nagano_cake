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

  # 注文日(管理者用)
  def get_admin_order_date

    created_at.strftime(DATE_FORMAT_1)

  end

  # 注文日
  def get_order_date

    created_at.strftime(DATE_FORMAT_2)

  end

  # 購入日時
  def get_purchase_date

    created_at.strftime(DATE_FORMAT_3)

  end


  # 支払金額 (送料 + 請求額 + "円" コンマ付)
  def get_payment

    payment = postage + total_payment

    payment.to_s(:delimited) + "円"

  end

  # 送料 ("円" コンマ付)
  def get_postage

    postage.to_s(:delimited) + "円"

  end

  # 請求額  ("円" コンマ付)
  def get_total_payment

    total_payment.to_s(:delimited) + "円"

  end

  # 商品合計(請求額 - 送料 + "円" コンマ付)
  def get_product_total

    product_total = total_payment - postage

    product_total.to_s(:delimited) + "円"

  end

  # [Update] 2023/03/15 配送先郵便番号表示修正
  # 配送先郵便番号(〒付き)
  def get_postal_code

     '〒' + postal_code

  end

  #　配送先情報（管理者用）<br> 〒 + 郵便番号 + 住所 (間に半角スペース)
  def get_address_display_admin

    '〒' + postal_code + HALF_WIDTH_SPACE + address

  end


end
