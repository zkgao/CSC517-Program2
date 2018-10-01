Rails.application.routes.draw do
  resources :inquiries
  devise_for :users
  resources :users
  resources :real_estate_companies
  resources :searches
  resources :houses
  resources :pictures
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
