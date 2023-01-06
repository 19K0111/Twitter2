Rails.application.routes.draw do
  get 'dislikes/list'
  get 'likes/list'
  put "follows/follow/:id" => "follows#follow", :as => 'follows_follow'
  put "follows/cancel/:id" => "follows#cancel", :as => 'follows_cancel'
  put "likes/add/:id" => "likes#add", :as => 'likes_add'
  put "likes/cancel/:id" => "likes#cancel", :as => 'likes_cancel'
  put "dislikes/add/:id" => "dislikes#add", :as => 'dislikes_add'
  put "dislikes/cancel/:id" => "dislikes#cancel", :as => 'dislikes_cancel'
  # resources :follows
  devise_for :users
  get "tweets", :to => "tweets#index", :as => :user_root
  get "users/show"

  resources :users do
    resources :follows
  end
  resources :users do
    resources :likes
  end
  resources :users do
    resources :dislikes
  end
  resources :tweets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root :to => "tweets#index"
end
