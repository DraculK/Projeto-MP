Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace :v1 do
      post 'sign_in', to: "sessions#sign_in"
      get 'show/:id', to: 'sessions#show'
      post 'create', to: 'sessions#create'
    end
  end
end
