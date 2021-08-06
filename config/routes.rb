Rails.application.routes.draw do
  resources :tags
  # delete "/tags/:id", to: "tags#destroy", as: :tag_delete
  # get 'sessions/new'
  root 'sessions/new'

  resources :posts do
    collection do
      post :confirm
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:index, :create, :destroy]

end
