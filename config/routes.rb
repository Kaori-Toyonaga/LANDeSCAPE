Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'

  root to: 'sessions#new'

  post '/admin_guest_login', to: "admin_guest_sessions#create"
  post '/guest_login', to: "guest_sessions#create"

  resources :posts do
    collection do
      post :confirm
    end
  end

  resources :sessions

  resources :users do
    get :following, on: :member
    get :followers, on: :member
    get :favorites, on: :collection
  end

  resources :favorites, only: [:index, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :tags

  namespace :admin do
    resources :users
  end

end
