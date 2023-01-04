Rails.application.routes.draw do
  put "follows/follow/:id" => "follows#follow", :as => 'follows_follow'
  put "follows/cancel/:id" => "follows#cancel", :as => 'follows_cancel'
  # resources :follows
  devise_for :users
  get "tweets", :to => "tweets#index", :as => :user_root
  get "users/show"

  resources :users do
    resources :follows
  end
  resources :tweets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root :to => "tweets#index"
end
