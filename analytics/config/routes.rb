require 'karafka/web'

Rails.application.routes.draw do
  mount Karafka::Web::App, at: '/karafka'
  resources :opportunities, only: :index

  root to: 'opportunities#index'
end
