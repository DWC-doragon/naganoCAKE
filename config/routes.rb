Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords, :registrations], controllers: {
  sessions: 'public/sessions'
}
devise_scope :customer do
    get 'customers/sign_up', to: 'public/registrations#new', as: :new_customer_registration
    post 'customers/sign_up', to: 'public/registrations#create', as: :customer_registration
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
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
   end

  scope module: 'customers' do
  end

  namespace :customers do
   resources :genres, only: [:show]


   get 'orders/about' => 'orders#about', as: 'orders_about'
   get 'orders/complete' => 'orders#complete'
   resources :orders, only: [:create, :new, :index, :show]
   resources :cart_items, only: [:index, :create, :update, :destroy]
   delete 'cart_items' => 'cart_items#destroy_all', as: 'destroy_all'
   resources :shippings, only: [:index, :create, :destroy, :edit, :update]
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
   resources :order_details, only: [:update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
