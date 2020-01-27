Rails.application.routes.draw do
  get 'profile/index'
  
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :genres
  resources :authors
  resources :books
  resources :purchases
  resources :reviews

  root 'books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
