Rails.application.routes.draw do
  devise_for :users
  root to:'homepage#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :city_ereas
  resources :materials
  resources :levels

  # Defines the root path route ("/")
  # root "articles#index"
end
