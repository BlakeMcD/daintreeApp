Rails.application.routes.draw do
  resources :address
  resources :items
  resources :stores do
    resources :items, only: [:index, :show]
    end
  resources :users

  #home
  root 'items#home'

  #admin
  get "/admin", to: "users#admin"

  #custom routes
  get "/men", to: "items#men"
  get "/women", to: "items#women"

  #User Session
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  # get "/users/:id/edit", to: "users#edit"
  # get "/login_first", to: "users#login_first"

  #OmniAuth
  get '/auth/facebook/callback' => 'sessions#create_facebook'

  #Add to cart
  get 'cart', to: 'items#cart' #to display cart
  post 'items/add_to_cart/:id', to: 'items#add_to_cart', as: 'add_to_cart'
  delete 'items/remove_from_cart/:id', to: 'items#remove_from_cart', as: 'remove_from_cart'
  delete 'items/remove_from_cart_in_cart/:id', to: 'items#remove_from_cart_in_cart', as: 'remove_from_cart_in_cart'
  #STORE SESSION - Not active
end
