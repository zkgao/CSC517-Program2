Rails.application.routes.draw do
  devise_for :admins
  resources :inquiries
  devise_for :users
  scope "/admins" do
    resources :users
  end
  resources :real_estate_companies
  resources :searches
  resources :houses
  resources :pictures
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  get '/houses/potential_buyers/:house_id', to: 'potential_buyers#potential_buyers'
  get "/adminmanage" => "home#adminindex"
  get "/admin/users" => "users#index"
end
