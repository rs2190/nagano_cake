class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # [Add] 2023/03/22 バリエーション追加
  # バリデーション
  with_options presence: true do

    validates :email

  end


end
