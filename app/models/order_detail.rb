class OrderDetail < ApplicationRecord

  # [Add] 2023/03/10 customersとordersの 1 : N のアソシエーション実装
  belongs_to :order
  belongs_to :item

  # [Add] 2023/02/26 orderdetailモデルに製作ステータスのenum実装
  enum making_status: { cannot_start: 0, waiting_for_payment: 1, in_production: 2, completion_of_production: 3 }

end
