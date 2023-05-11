Rails.application.routes.draw do
  root 'welcome_page#index'
  devise_for :users
end
