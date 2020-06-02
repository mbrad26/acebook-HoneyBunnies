Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'

  get 'login', to: 'users#index'
  get 'about', to: 'users#about'
  resources :posts
end
