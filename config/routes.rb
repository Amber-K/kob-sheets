Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

  resource :session, only: [:new, :create, :destroy]

  resources :users
  get "signup" => "users#new"
end
