Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace :v1 do
      post 'sign_in', to: "sessions#sign_in"

      scope 'alternatives/' do
        post 'create', to:  "alternatives#create"
        patch 'update/:id', to: "alternatives#update"
        get 'index', to: "alternatives#index"
        get 'show/:id', to: "alternatives#show"
        delete 'delete/:id', to: "alternatives#delete"
      end

      scope 'questions/' do
        post 'create', to: 'questions#create'
        get 'show/:id', to: 'questions#show'
        delete "delete/:id", to: "questions#delete"
        put "update/:id", to: "questions#update"
      end

      scope 'quizzes/' do
        post 'create', to:  "quizzes#create"
        patch 'update/:id', to: "quizzes#update"
        get 'index', to: "quizzes#index"
        get 'show/:id', to: "quizzes#show"
        delete 'delete/:id', to: "quizzes#delete"
      end
    end
  end
end
