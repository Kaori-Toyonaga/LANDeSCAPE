Rails.application.routes.draw do
  root to: 'sessions#new'

  get 'relationships/create'
  get 'relationships/destroy'

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
