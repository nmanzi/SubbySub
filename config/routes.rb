require 'subdomain'

Subbysub::Application.routes.draw do
  resources :links
  constraints(Subdomain) do
    match '/' => 'links#show'
  end
  root :to => 'links#index'
end
