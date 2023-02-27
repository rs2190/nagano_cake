Rails.application.routes.draw do

  #　[Add] 2023/02/27 トップページ、アバウトページ画面のみ実装
  root to:  'public/homes#top'
  get 'about'  => 'public/homes#about', as: 'about'

  namespace :public do

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # # 【顧客用】
  # devise_for :customers
  # # 【管理者用】
  # devise_for :admins

  # [Add] 2023/02/27 devise管理者側,顧客側のview,controller実装
  # 【顧客用】
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'

  }

  # 【管理者用】
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  #　[Add] 2023/02/27 管理者トップページ(注文履歴一覧)画面のみ実装
  get 'admin' => 'admin/homes#top', as: 'admin_home_top'

  namespace :admin do

  end

end
