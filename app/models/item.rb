class Item < ApplicationRecord

  # [Add] 2023/03/08 Activestorage実装
  # 商品の画像をアップロードする
  has_one_attached :image

  # [Add] 2023/03/08 genresとitemsの 1 : N のアソシエーション実装
  # 1 : N　の関連付け（アソシエーション: association）
  belongs_to :genre

end
