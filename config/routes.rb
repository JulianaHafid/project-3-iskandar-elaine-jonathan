Rails.application.routes.draw do

  get 'orders/new'

  get 'events/index' => 'events#index'
  resources :events


  devise_for :users, :controllers => { registrations: 'registrations' }, :path_prefix => 'my'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :requests

  get 'static/homepage' => 'static#homepage'

  # resources :charges
  resources :orders

  root 'static#homepage'
end
