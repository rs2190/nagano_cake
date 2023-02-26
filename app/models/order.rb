class Order < ApplicationRecord

  # [Add] 2023/02/26 orderモデルに支払方法のenum実装
  enum payment_method: { credit_card: 0, transfer: 1 }


end
