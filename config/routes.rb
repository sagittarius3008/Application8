Rails.application.routes.draw do
  get 'books/search' => 'searches#search'
  devise_for :users
  root to: 'homes#top'
  resources :users,only: [:show,:index,:edit,:update,:destroy] do
    member do
      get :following, :followers
    end
  end
  resources :groups do
    resources :group_users, only: :create
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments,only: [:create,:destroy]
  end
  resources :relationships,       only: [:create, :destroy]
  get 'home/about' => 'homes#about'
end