class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 1 : N　の関連付け（アソシエーション: association）
  # [Add] 2023/03/04 customersとaddressesの 1 : N のアソシエーション実装
  has_many :addresses, dependent: :destroy

  # [Update & Fix] 2023/03/07 ①定数クラス仕様　②マイページ更新時 redirect to修正etc
  # 定数クラス
  include Constants


  # "[Add] 2023/03/03 顧客のマイページ実装"

  # 姓 + 名
  def name

    last_name + first_name

  end

  # 姓 + "□" + 名 (□は、全角スペース)
  def name_blank

    last_name + FULL_WIDTH_SPACE + first_name

  end

    # 姓カナ + 名カナ
  def name_kana

    last_name_kana + first_name_kana

  end

  # 姓 + "□" + 名 (□は、全角スペース)
  def name_kana_blank

    last_name_kana + FULL_WIDTH_SPACE + first_name_kana

  end


end
