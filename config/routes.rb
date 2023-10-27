Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => {:registrations => "custom_devise/registrations"}

  root 'search#index'
  resources :users

  namespace :search do
    get '/', action: :index, as: :index
  end

  namespace :baskets do
    get '/', action: :index, as: :index
    post :send_to_basket
    post :clear_basket
  end
end
