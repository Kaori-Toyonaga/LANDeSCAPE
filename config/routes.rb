Rails.application.routes.draw do
  root to: 'sessions#new'
  # root 'sessions/new'

  resources :posts do
    collection do
      post :confirm
    end
  end

  resources :sessions
  resources :users
  resources :favorites, only: [:index, :create, :destroy]
  resources :tags

  namespace :admin do
    resources :users
  end

end
