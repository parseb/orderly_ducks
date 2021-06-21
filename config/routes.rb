Rails.application.routes.draw do
  resources :showdowns
  devise_for :users
  root to: "home#landing"

  get "/workspace/:id", to: "workspace#start", as: "workspace" 

  get "/users/", to: 'home#landing', method: :get  

  resources :sessions

  post "/addsession/", to: "sessions#addsession", as: "addsession"

end
