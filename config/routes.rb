Rails.application.routes.draw do

  get 'events/index' => 'events#index'
  resources :events

  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'static/homepage' => 'static#homepage'

  root 'static#homepage'
end
