Rails.application.routes.draw do

  devise_for :users, :controllers => {
    registrations: 'registrations'}
  
  root 'events#index'

  resources :users, only: [:show]

  resources :events


  resources :charges
  
  resources :attendances
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end