class Genre < ApplicationRecord

  # [Add] 2023/03/08 genresとitemsの 1 : N のアソシエーション実装
  # [Add] 2023/03/09 dependent: :destroy追加
  # 1 : N　の関連付け（アソシエーション: association）
  has_many :items, dependent: :destroy

  # [Add] 2023/03/22 バリエーション追加
  # バリデーション
  with_options presence: true do

    validates :name

  end

end
