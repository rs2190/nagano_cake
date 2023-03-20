# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者権限ユーザー追加

# [Add] 2023/03/02 管理者権限ユーザー追加

# 管理者
Admin.create!(
             email: "admin@example.jp",
             password:  "000000",
             )

# ジャンル
Genre.create!(
   name: "ケーキ"
)

Genre.create!(
   name: "焼き菓子"
)

Genre.create!(
   name: "プリン"
)

Genre.create!(
   name: "キャンディ"
)

Genre.create!(
   name: "ゼリー"
)

Genre.create!(
   name: "チョコレート"
)
