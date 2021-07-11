Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :relationships,       only: [:create, :destroy]
  resources :informations, only: [:new,:create]
  resources :users,only: [:show,:index,:edit,:update,:destroy] do
    member do
      get :following, :followers
    end
  end
  resources :groups do
    resources :group_users, only: [:create, :destroy]
    get "join" => "groups#join"
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments,only: [:create,:destroy]
  end
  get 'home/about' => 'homes#about'
  get 'books/search' => 'searches#search'
  get 'information/confirm'=> 'informations#confirm'
  # get 'informations/send_mail' =>'informations#send_mail'
  
end