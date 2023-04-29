require 'karafka/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  with_dev_auth = lambda do |app|
    Rack::Builder.new do
      use Rack::Auth::Basic do |username, password|
        username == 'marcelo' && password == 'marcelo'
      end

      run app
    end
  end

  mount with_dev_auth.call(Karafka::Web::App), at: '/karafka'

  resources :leads

  root to: 'leads#index'
end
