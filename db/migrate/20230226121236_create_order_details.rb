class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      # 注文ID
      t.integer :order_id,      null: false
      # 商品ID
      t.integer :item_id,       null: false
      # 単価（税込）
      t.integer :price,         null: false
      # 数量
      t.integer :amount,        null: false
      # 製作ステータス
      t.integer :making_status, null: false, default: 0

      t.timestamps

    end
  end
end
