class OrderDetail < ApplicationRecord

  # [Add] 2023/03/10 customersとordersの 1 : N のアソシエーション実装
  belongs_to :order
  belongs_to :item

  # [Add] 2023/02/26 orderdetailモデルに製作ステータスのenum実装
  enum making_status: { cannot_start: 0, waiting_for_payment: 1, in_production: 2, completion_of_production: 3 }


  # [Add] 2023/03/22 バリエーション追加
  # バリデーション
  with_options presence: true do

    validates :order_id
    validates :item_id
    validates :making_status

    with_options format: {with: /\A[0-9]+\z/, message: "は半角数字で入力して下さい"} do

      validates :price
      validates :amount

    end

  end

  # 小計　(単価（税込）* 数量)
  def get_subtotal

    price * amount

  end

  # 小計　(単価（税込）* 数量) コンマ付
  def get_subtotal_delimited

    get_subtotal.to_s(:delimited)

  end


end
