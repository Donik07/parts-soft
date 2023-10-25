Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => {:registrations => "custom_devise/registrations"}

  root 'home#index'
  resources :users
end
