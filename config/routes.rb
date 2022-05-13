Rails.application.routes.draw do
  resources :city_ereas
  resources :materials
  resources :levels
  devise_for :users
  root to:'homepage#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
