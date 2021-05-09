Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace :v1 do
      post 'sign_in', to: "sessions#sign_in"

      scope 'questions/' do
        post 'create', to: 'questions#create'
        get 'show/:id', to: 'questions#show'
        delete "delete/:id", to: "questions#delete"
        put "update/:id", to: "questions#update"
      end
    end
  end
end
