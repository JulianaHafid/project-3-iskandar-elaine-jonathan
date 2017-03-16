Rails.application.routes.draw do


  get 'events/index' => 'events#index'
  resources :events


  devise_for :users, :controllers => { registrations: 'registrations' }, :path_prefix => 'my'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :requests

  # patch 'requests/:id:status' => "requests#updateStatus"

  get 'static/homepage' => 'static#homepage'
  get '/landing' => 'static#landing'

  # resources :charges
  resources :transactions

  get 'transactions/:id/showTrans' => "transactions#showTrans", :as => "showTrans"
  get 'user/history' => "users#history"

  root 'static#homepage'
end
