class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # "[Add] 2023/03/03 顧客のマイページ実装"

  # 姓 + 名
  def name

    last_name + first_name

  end

  # 姓 + "□" + 名 (□は、全角スペース)
  def name_blank

    last_name + "　" + first_name

  end

    # 姓カナ + 名カナ
  def name_kana

    last_name_kana + first_name_kana

  end

  # 姓 + "□" + 名 (□は、全角スペース)
  def name_kana_blank

    last_name_kana + "　" + first_name_kana

  end


end
