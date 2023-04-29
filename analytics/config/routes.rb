require 'karafka/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount Karafka::Web::App, at: '/karafka'
  resources :opportunities, only: :index

  root to: 'opportunities#index'
end
