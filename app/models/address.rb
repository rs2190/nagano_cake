class Address < ApplicationRecord

  # 1 : N　の関連付け（アソシエーション: association）
  # [Add] 2023/03/04 customersとcart_itemsの 1 : N のアソシエーション実装
  belongs_to :customer

  #
  def get_address_display
    
    '〒' + postal_code + ' ' + address + ' ' + name
  end

end
