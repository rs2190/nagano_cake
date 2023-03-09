class Item < ApplicationRecord

  # [Add] 2023/03/08 Activestorage実装
  # 商品の画像をアップロードする
  has_one_attached :image

  # [Add] 2023/03/08 genresとitemsの 1 : N のアソシエーション実装
  # 1 : N　の関連付け（アソシエーション: association）
  belongs_to :genre

  # [Add] 2023/03/08 商品詳細画面実装etc
  # 商品画像のgetterメソッド。<br>画像サイズ指定可能(width(integer):横,height(integer):高さ)(px)
  def get_image(width, height)

    # プロフィール画像が存在するか。
    unless image.attached?

      # 存在しない場合

      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')

    end

    # 画像サイズの変更(px)
    image.variant(resize_to_limit: [width, height]).processed

  end

  # [Add] 2023/03/08 商品詳細画面実装etc
  # 税込価格
  def get_tax_included_price

    (price * 1.1).floor

  end

  # [Add] 2023/03/09 価格コンマ付きメソッド実装
  # 税抜価格（コンマ付き）
  def get_price_delimited

    price.to_s(:delimited)

  end

    # 税込価格（コンマ付き）
  def get_tax_included_price_delimited

    get_tax_included_price.to_s(:delimited)

  end

end
