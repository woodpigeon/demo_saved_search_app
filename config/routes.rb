Rails.application.routes.draw do
  get 'searches/index'

  devise_for :accounts
  resources :saved_searches
  root to: 'saved_searches#index'

  require "resque_web"
  ResqueWeb::Engine.eager_load!
  mount ResqueWeb::Engine => "/resque_web"
  
end
