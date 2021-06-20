Rails.application.routes.draw do
  resources :showdowns
  devise_for :users
  root to: "home#landing"

  get "/workspace/:id", to: "workspace#start", as: "workspace" 

  get "/users/", to: 'home#landing', method: :get  

  #get '*path', to: 'home#landing' #revise

  resources :sessions


    # devise_scope :user do 
  #   root to: 'static_pages#home'
  #   match '/sessions/user', to: 'devise/sessions#create', via: :post
  # end

  post "/addsession/", to: "sessions#addsession", as: "addsession"
  #devise_for :installs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
