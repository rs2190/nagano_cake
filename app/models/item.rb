class Item < ApplicationRecord

  # [Add] 2023/03/08 Activestorage実装
  # 商品の画像をアップロードする
  has_one_attached :image

end
