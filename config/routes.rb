Rails.application.routes.draw do
  resources :merchants

  root 'home#index'
  devise_for :users

  get 'search', to: 'merchants#search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
