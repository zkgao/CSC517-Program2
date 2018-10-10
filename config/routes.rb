Rails.application.routes.draw do
  resources :interests
  resources :inquiries
  devise_for :users
  resources :users
  resources :real_estate_companies
  resources :searches
  get '/houses/potential_buyers/:house_id', to: 'potential_buyers#potential_buyers'
  resources :houses
  resources :pictures
  post '/houses/:house_id', to: 'houses#reply'
  get '/users/inquiries/:userid', to: 'inquires#hshow'


  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
