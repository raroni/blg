Blg::Application.routes.draw do |map|
  resources :posts, :except => :show
  resources :users, :except => [:show, :destroy]
  
  get 'login', :to => 'sessions#new'
  get 'logout', :to => 'sessions#destroy'
  post 'sessions', :to => 'sessions#create'
  
  root :to => 'posts#index'
  
  get ':permalink', :to => 'posts#show', :as => :post
end
