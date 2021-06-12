Rails.application.routes.draw do
  devise_for :users
  root to: "home#landing"

  get "/workspace/:id", to: "workspace#start", as: "workspace" 

  #devise_for :installs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
