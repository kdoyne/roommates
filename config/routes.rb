Roommates::Application.routes.draw do
  
  root"welcome#index"

  resources :users

  resources :houses

  resources :events do
    resources :reminders
  end

  resources :bills

  resources :shoppings

  get '/sms', to: 'sms#method'

  get "/sessions", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#delete"

end
