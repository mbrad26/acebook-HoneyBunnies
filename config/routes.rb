Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'
  get '/sessions/new', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/sessions/destroy', to: 'sessions#destroy'
  get '/users/:id', to: 'users#show'
  get '/users/:id/edit', to: 'users#edit'
  post '/users', to: 'users#create'
  patch '/users/:id/edit', to: 'users#update'

  #resources :sessions, only: [:new, :destroy]
  resources :posts
end
