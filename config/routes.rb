Rails.application.routes.draw do
  root "users#feed"

  devise_for :users
  
  resources :comments, except: [:show, :index]
  resources :follow_requests, except: [:show, :index]
  resources :likes, except: [:show, :index]
  resources :photos

  get ":username" => "users#show", as: :user
  get ":username/liked" => "users#liked", as: :liked
  get ":username/feed" => "users#feed", as: :feed
  get ":username/discover" => "users#discover", as: :discover
  get ":username/followers" => "users#followers", as: :followers
  get ":username/following" => "users#following", as: :following

end