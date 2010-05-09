Blog::Application.routes.draw do |map|
  resources :users, :except => [:show, :destroy]
  
  get 'login', :to => 'sessions#new'
  post 'sessions', :to => 'sessions#create'
end
