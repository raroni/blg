Blg::Application.routes.draw do |map|
  resources :posts
  resources :users, :except => [:show, :destroy]
  
  get 'login', :to => 'sessions#new'
  post 'sessions', :to => 'sessions#create'
  
  root :to => 'posts#index'
end
