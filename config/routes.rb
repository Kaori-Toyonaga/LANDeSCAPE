Rails.application.routes.draw do
  root 'sessions#new'

  resources :tags

  resources :posts do
    collection do
      post :confirm
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:index, :create, :destroy]

end
