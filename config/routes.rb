Rails.application.routes.draw do
  get 'admin/check_if_admin'
  root 'events#index'

  devise_for :users, :controllers => {
    registrations: 'registrations'}

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end

  resources :events do
    resources :attendances, only: [:index, :new, :create]
    resources :event_pictures
  end
  
  namespace :admin do
    root 'admin#show'
    resources :events, :users, :event_submissions
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end