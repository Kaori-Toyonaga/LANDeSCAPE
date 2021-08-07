Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root to: 'sessions#new'

  resources :posts do
    collection do
      post :confirm
    end
  end

  resources :sessions
  resources :users, only: [:index]
  resources :favorites, only: [:index, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :tags

  namespace :admin do
    resources :users
  end

end
