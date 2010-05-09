Blog::Application.routes.draw do |map|
  resources :users, :except => [:edit, :update, :show]
end
