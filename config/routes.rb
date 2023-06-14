Rails.application.routes.draw do
  root 'welcome_page#index'
  devise_for :users
  resources :products, only: [:new, :create, :index]
  resources :meals
  resources :users, except: [:index, :destroy]
  resources :profiles, only: [:create, :edit, :new, :show, :update]
end
