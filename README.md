# DMM WEBCAMPコンテンツ課題

## 就業両立コース(クラウド必須)_応用知識学習フェーズver1.3 実装

## nagano_cake
長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発。

### rubyバージョン
- ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [x86_64-linux]

###  フレームワーク railsバージョン
- Rails 6.1.7.2

### Gemfile (bundle install)
- devise
- pry-rails
- enum_help
- image_processing , ~> 1.2
- kaminari, ~> 1.2.1

### yarn
- yarn add jquery bootstrap@4.5 popper.js
- yarn add @fortawesome/fontawesome-free@5.15.4

### logo
- https://www.shopify.com/jp/tools/logo-maker

### インストール　git clone後の処理
- $ git clone git@github.com:rs2190/nagano_cake.git
- $ cd nagano_cake
- $ bundle install
- $ yarn install
- $ rails webpacker:install
- $ rails webpacker:compile
- $ rails db:migrate (rake db:migrate:reset)
- $ rails db:seed

###　実装者
- 鈴木 龍