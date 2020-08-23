Rails.application.routes.draw do
  get '/negative_events/new', to: 'negative_events#new'
  resources :negative_events

  root to: 'cover#home'
  get '/users/new', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'sessions/new'
  namespace :admin do
    resources :users
  end
  
  get '/event/index', to: 'events#index'
  
  resources :events do
    post :confirm, action: :confirm_new, on: :new
    post :import, on: :collection
  end
end
