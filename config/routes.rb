Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :users
  resources :posts do
    post 'add' => 'favorites#create'
    delete '/add' => 'favorites#destroy'
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
#      get 'search_Ransack', as: :detailed_search
    end
  end
end
