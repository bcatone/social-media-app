Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :destroy]
  
  # Auth routes
  get '/me', to: 'sessions#show'
  post '/login', to: 'sessions#create'
  delete '/logout', to:'sessions#destroy'
  post '/signup', to: 'users#create'
  delete '/cancel', to: 'users#destroy'
  
end
