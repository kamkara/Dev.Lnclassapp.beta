Rails.application.routes.draw do
  get "bac-philo", to:'sign_up#prepa_philo'
  get "bac-ivoire", to:'sign_up#prepa_bac_ivoire'
  get "partners", to:'sign_up#prepa_partners'
  
  ####### Home page #######
  root to:'homepage#index'
  get "feed", to:'home#index'
  get "t", to:'home#team'
  get "partner", to:'home#post'
  
  #landing
 
  get "corriger-mes-lacunes", to:'page#index'
  get "prepa-bac", to:'page#show'
  
  ####### Omboarding #######
  get "welcome", to:'welcomes#new'
  
  
  ####### Egal && Data  #######
  get "mission", to:'compagny#mission'
  get "cgu", to:'compagny#terms'
  get "data", to:'compagny#data'
  get 'compagny/membership'

  
  ####### Analytics && Data  #######
  authenticate :user, ->(user) { user.status == "Team" } do
    mount Blazer::Engine, at: "blazer"
    mount ActiveAnalytics::Engine, at: "analytics"  # http://localhost:3000/analytics
  end
  
  #Course
  get "courses-show", to:"courses#show"
  get "course-list", to:"courses#index"
  get "new-course", to:"courses#new"
  
  #Dashboard
  get "dashboard", to:'dashboard#index'
  get "setting", to:'dashboard#home'
  get "new-materials", to:"materials#new"
  get "new-levels", to:"levels#new"
  get "dashboard", to:'admin#index'
  get "city-list", to:"city_ereas#index"
  

  resources :courses do
    resources :exercices, only: [:new, :create, :show, :index]
    get "exercices", to:"exercices#index"
    post '/publish', to: 'exercices#publish'
  end
  
  
  resources :exercices, except: [:new, :show, :edit, :create, :update, :destroy, :index] do
    member do
      delete 'delete', to: 'exercices#destroy'
    end
    resources :questions, only: [:new, :create, :destroy]
    resources :results, only: [:new, :create]
  end
  
  ###### Ressources ########
  resources :levels, :city_ereas, :courses, :materials,
  :results, :answers, :questions, :exercices,
  :welcomes, :landpages
  
  ######### USER DATA #########
  devise_scope :user do
    get 'profile/edit'    => 'devise/registrations#edit',   :as => :edit_user_registration
    get 'profile/cancel'  => 'devise/registrations#cancel', :as => :cancel_user_registration
  end

  devise_for  :users,
  :path => '',
  :path_names => 
              { :sign_in =>     'connexion',
                :sign_out =>     'logout',
                :sign_up =>       '',
                :registration =>  'inscription',
                :edit =>          'edit'
              }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
