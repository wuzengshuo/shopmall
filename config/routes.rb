Rails.application.routes.draw do
  get 'dashboard/index'
  resources :orders do
    member do
      post :change_order_status
    end
  end
  resources :products
  resources :product_categories
  resources :admin_users
  resources :home do
    collection do
      get :order_new
      get :order_list
      post :order_create
      get :payment_new
      post :payment_create
      post :comment_create
      get :ok
      post :cancel_order
    end
  end
  root 'home#index'
  get 'sessions/new'
  get 'register', to: 'users#new'
  post 'register', to: 'users#create'
  get 'change_password', to: "users#edit"
  get 'edit_info', to: "users#edit_info"
  post 'update_info', to: "users#update_info"
  post 'change_password', to: "users#change_password"
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
