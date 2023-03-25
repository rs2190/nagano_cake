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
             password:  "000000"
             )

# ジャンル
# id = 1
Genre.create!(
   name: "ケーキ"
)

# id = 2
Genre.create!(
   name: "焼き菓子"
)

# id = 3
Genre.create!(
   name: "プリン"
)

# id = 4
Genre.create!(
   name: "キャンディ"
)

# id = 5
Genre.create!(
   name: "ゼリー"
)

# id = 6
Genre.create!(
   name: "チョコレート"
)

# 顧客

50.times  do |n|

    Customer.create!(
      email: "test#{n + 1}@xxxx.com",
      first_name: "名#{n + 1}",
      last_name: "姓#{n + 1}",
      first_name_kana: "セイ",
      last_name_kana: "メイ",
      password: "000000",
      postal_code: "1000001",
      address: "東京都千代田区大手町1-1-1 実装マンション#{n + 1}階",
      telephone_number: "09000000000"
    )

end

# 商品
item01 =
Item.create!(
    genre_id: 1,
    name: "ショートケーキ（1ホール）" ,
    introduction: "定番のおいしさです。",
    price: 2000,
)

item02 =
Item.create!(
    genre_id: 2,
    name: "バタープレーンクッキー" ,
    introduction: "バターの香りが最高です。8個入り。",
    price: 800,
)

item03 =
Item.create!(
    genre_id: 5,
    name: "初夏の甘夏ゼリー" ,
    introduction: "初夏にちょうど良いです。",
    price: 780,
)

item04 =
Item.create!(
    genre_id: 3,
    name: "カスタードプリン" ,
    introduction: "濃厚です。",
    price: 860,
)

item05 =
Item.create!(
    genre_id: 1,
    name: "ふんわりロールケーキ" ,
    introduction: "ふわふわでクリーミーです。",
    price: 970,
)

item06 =
Item.create!(
    genre_id: 2,
    name: "チョコチップクッキー" ,
    introduction: "ビターなのに甘く感じるときもあります。8個入り。",
    price: 860,
)

item07 =
Item.create!(
    genre_id: 3,
    name: "濃厚かぼちゃプリン" ,
    introduction: "ビターなのに甘く感じるときもあります。8個入り。",
    price: 940,
)

item08 =
Item.create!(
    genre_id: 3,
    name: "さくさくカラフルマカロン" ,
    introduction: "色々な味を楽しめます。12個入り。",
    price: 1800,
)

item09 =
Item.create!(
    genre_id: 4,
    name: "キャンディアソート" ,
    introduction: "色々な味を楽しめます。16個入り。",
    price: 1770,
)

item10 =
Item.create!(
    genre_id: 1,
    name: "濃厚ティラミス（1個）" ,
    introduction: "チーズとショコラのバランスがgood!",
    price: 890,
)

item11 =
Item.create!(
    genre_id: 1,
    name: "ガドーショコラケーキ（1ホール）" ,
    introduction: "ものすごいビターです。",
    price: 2170,
)

item12 =
Item.create!(
    genre_id: 3,
    name: "クッキーセット" ,
    introduction: "バタープレーンクッキーとチョコチップクッキーの2種類（10個ずつ）が入ってます。お中元にどうぞ",
    price: 1160,
)

item13 =
Item.create!(
    genre_id: 6,
    name: "定番の板チョコ" ,
    introduction: "昔ながらのチョコレート。料理の隠し味にも使えて好評です。",
    price: 480,
)

# 商品画像

# 用意しようとした画像は若干グレーなため。格納場所の画像を削除。使用する際は、以下の格納場所とファイル名を設定して用意すること。

# item01.image.attach(io: File.open(Rails.root.join('app/assets/images/items/item_01.jpg')), filename: 'item_01.jpg')
# item02.image.attach(io: File.open(Rails.root.join('app/assets/images/items/item_02.jpg')), filename: 'item_02.jpg')
# item03.image.attach(io: File.open(Rails.root.join('app/assets/images/items/item_03.jpg')), filename: 'item_03.jpg')
# item04.image.attach(io: File.open(Rails.root.join('app/assets/images/items/item_04.jpg')), filename: 'item_04.jpg')
# item05.image.attach(io: File.open(Rails.root.join('app/assets/images/items/item_05.jpg')), filename: 'item_05.jpg')
# item06.image.attach(io: File.open(Rails.root.join('app/assets/images/items/item_06.jpg')), filename: 'item_06.jpg')
# item07.image.attach(io: File.open(Rails.root.join('app/assets/images/items/item_07.jpg')), filename: 'item_07.jpg')
# item08.image.attach(io: File.open(Rails.root.join('app/assets/images/items/item_08.jpg')), filename: 'item_08.jpg')
# item09.image.attach(io: File.open(Rails.root.join('app/assets/images/items/item_09.jpg')), filename: 'item_09.jpg')
# item10.image.attach(io: File.open(Rails.root.join('app/assets/images/items/item_10.jpg')), filename: 'item_10.jpg')
# item11.image.attach(io: File.open(Rails.root.join('app/assets/images/items/item_11.jpg')), filename: 'item_11.jpg')
# item12.image.attach(io: File.open(Rails.root.join('app/assets/images/items/item_12.jpg')), filename: 'item_12.jpg')
# item13.image.attach(io: File.open(Rails.root.join('app/assets/images/items/item_13.jpg')), filename: 'item_13.jpg')
