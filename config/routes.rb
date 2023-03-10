Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords, :registrations], controllers: {
  sessions: 'public/sessions'
}
devise_scope :customer do
    get 'customers/sign_up', to: 'public/registrations#new', as: :new_customer_registration
    post 'customers/sign_up', to: 'public/registrations#create', as: :customer_registration
  end
  
    # customer側ルーティング
  scope module: 'public' do
    root 'homes#top'
    resources :products, only: [:show, :index]
    get 'about' => 'homes#about'
    get 'customers/my_page' => 'customers#show'
    patch 'customers/update' => 'customers#update'
    get 'customers/edit' => 'customers#edit'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdrawal' => 'customers#withdrawal'
    resources :genres, only: [:show]

    get 'orders/complete' => 'orders#complete'
    resources :shippings, only: [:index, :create, :destroy, :edit, :update]
    resources :orders, only: [:create, :new, :index, :show]

    post 'orders/confirm' => 'orders#confirm'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete "cart_items" => "cart_items#destroy_all"
  end

  namespace :customers do
    get 'orders/about' => 'orders#about', as: 'orders_about'

  end

  # admin側ルーティング
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    get 'admin' => 'admin#top'
    resources :customers, only: [:index, :edit, :update, :show]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :products, only: [:show, :index, :new, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :orderd_products, only: [:update]
  end

  get "/search" => "products#search"

end
