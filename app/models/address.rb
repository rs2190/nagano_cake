class Address < ApplicationRecord
  
  # 1 : N　の関連付け（アソシエーション: association）
  # [Add] 2023/03/04 customersとaddressesの 1 : N のアソシエーション実装
  belongs_to :customer

end
