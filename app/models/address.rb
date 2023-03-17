class Address < ApplicationRecord

  # 1 : N　の関連付け（アソシエーション: association）
  # [Add] 2023/03/04 customersとcart_itemsの 1 : N のアソシエーション実装
  belongs_to :customer

  # 定数クラス
  # config/initializers/constants.rb
  include Constants

  #　配送先情報（画面表示用）<br> 〒 + 郵便番号 + 住所 + 宛名 (間に半角スペース)
  def get_address_display

    '〒' + postal_code + HALF_WIDTH_SPACE + address + HALF_WIDTH_SPACE + name

  end

end
