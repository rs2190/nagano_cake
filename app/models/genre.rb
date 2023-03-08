class Genre < ApplicationRecord

  # [Add] 2023/03/08 genresとitemsの 1 : N のアソシエーション実装
  # 1 : N　の関連付け（アソシエーション: association）
  has_many :items

end
