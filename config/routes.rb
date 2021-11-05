Rails.application.routes.draw do
  resources :address
  resources :items
  resources :stores
  resources :users

  #User Session
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  #Add to cart
  get 'about', to: 'items#about' #is this necessary??
  post 'items/add_to_cart/:id', to: 'items#add_to_cart', as: 'add_to_cart'
  delete 'items/remove_from_cart/:id', to: 'items#remove_from_cart', as: 'remove_from_cart'
  #STORE SESSION - Not active
end
