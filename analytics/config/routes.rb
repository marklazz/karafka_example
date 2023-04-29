require 'karafka/web'

Rails.application.routes.draw do
  with_dev_auth = lambda do |app|
      Rack::Builder.new do
        use Rack::Auth::Basic do |username, password|
          username == 'username' && password == 'password'
        end

        run app
      end
    end

  mount with_dev_auth.call(Karafka::Web::App), at: 'karafka'
  resources :opportunities, only: :index

  root to: 'opportunities#index'
end
