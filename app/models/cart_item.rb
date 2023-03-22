class CartItem < ApplicationRecord

  # 1 : N　の関連付け（アソシエーション: association）
  # [Add] 2023/03/04 customersとaddressesの 1 : N のアソシエーション実装
  belongs_to :customer
  # [Add] 2023/03/09 カート内商品データ追加・カート内商品一覧画面追加etc
  belongs_to :item

  # [Add] 2023/03/22 バリエーション追加
  # バリデーション
  with_options presence: true do

    with_options format: {with: /\A[0-9]+\z/, message: "は半角数字で入力して下さい"} do

      validates :amount

    end

  end


  #　小計出力メソッド（ 商品の税込 * 数量）
  def get_subtotal

      item.get_tax_included_price * amount
  end

  #　小計出力メソッド（ 商品の税込 * 数量）カンマ付き
  def get_subtotal_delimited

    get_subtotal.to_s(:delimited)

  end

end
