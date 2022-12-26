Rails.application.routes.draw do
  devise_for :users
  get "tweets", :to => "tweets#index", :as => :user_root
  get "users/show"

  resources :users
  resources :tweets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root :to => "tweets#index"
end
