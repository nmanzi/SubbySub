require 'subdomain'

Subbysub::Application.routes.draw do
  resources :links
  resources :sessions
  get 'login' => 'sessions#new', :as => 'login'
  get 'logout' => 'sessions#destroy', :as => 'logout'
  constraints(Subdomain) do
    match '/' => 'links#show'
  end
  root :to => 'links#index'
end
