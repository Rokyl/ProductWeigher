Rails.application.routes.draw do
  root 'welcome_page#index'
  devise_for :users
  resources :products, only: [:new, :create, :index]
end
