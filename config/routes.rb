Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :users
  resources :posts do
    post 'add' => 'favorites#create'
    delete '/add' => 'favorites#destroy'
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
end
