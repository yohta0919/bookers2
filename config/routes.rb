Rails.application.routes.draw do
  devise_for :users
  # get 'books/index'
  # get 'books/show'
  # get 'books/new'
get 'home/about' => 'info#about'
root :to => 'info#top'
resources :users#, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :post_images, only: [:new, :create, :index, :show]
end

