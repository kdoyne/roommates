Roommates::Application.routes.draw do
  
  root"welcome#index"

  resources :users, only: [:new, :create, :edit, :update, :destroy, :show]

  resources :houses, only: [:show, :new, :create]

  resources :events do
    resources :reminders
  end

  resources :bills, only: [:index, :create, :destroy]

  resources :shoppings, only: [:index, :create, :update, :destroy]

  get '/sms', to: 'sms#method'

  get "/sessions", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#delete"

end


# resources :products, only: [:show, :edit, :destroy, :create]