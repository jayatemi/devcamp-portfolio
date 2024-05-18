Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  #create custom routes for portfolio item
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end 
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'angular-items', to: 'portfolios#angular'

 
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  mount ActionCable.server => '/cable' 

  root to: 'pages#home'

  #create custom route using a block
  resources :blogs do 
    member do 
      get :toggle_status
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
