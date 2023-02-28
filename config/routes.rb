Rails.application.routes.draw do

  #　[Add] 2023/02/27 トップページ、アバウトページ画面のみ実装
  #  [Add & Update] 2023/02/28 ①商品一覧、商品詳細画面routing実装　②トップページ、アバウトページrouting修正
  # root to:  'public/homes#top'
  # get 'about'  => 'public/homes#about', as: 'about'

  # namespace :public do
  # moduleで、URLを変更せず、ファイル構成だけ指定のパスにする。
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    resources :items , only: [:index, :show]

    # [Add] 2023/02/28 public/customers routing実装
    get 'customers/my_page' => 'customers#show', as: 'show_customers'
    get 'customers/information/edit'=> 'customers#edit', as: 'edit_information_customers'
    patch 'customers/information' => 'customers#update', as: 'update_information_customers'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/goodbye' => 'customers#goodbye', as: 'goodbye'

    # [Add] 2023/02/28 public/customers routing実装
    resources :cart_items , only: [:index, :update, :destroy, :create]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'

    # [Add] 2023/02/28 public/orders routing実装
    resources :orders , only: [:new, :create, :index, :show]
    post 'orders/confirm' => 'orders#confirm', as: 'confirm'
    get 'orders/thanks' => 'orders#thanks', as: 'thanks'

    # [Add] 2023/02/28 public/addresses routing実装
    resources :addresses , only: [:index, :edit, :create, :update, :destroy]

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
    # [Add] 2023/02/28 admin/items routing実装
    resources :items , only: [:index, :new, :create, :show, :edit, :update]
    # [Add] 2023/02/28 admin/genres routing実装
    resources :genres , only: [:index, :create, :edit, :update]
    # [Add] 2023/02/28 admin/customers routing実装
    resources :customers , only: [:index, :show, :edit, :update]
    # [Add] 2023/02/28 admin/orders routing実装
    resources :orders , only: [:show, :update] do
       # [Add] 2023/02/28 admin/order_details routing実装
      resources :order_details, only: [:update]
    end

  end

end
