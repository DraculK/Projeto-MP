Rails.application.routes.draw do
  root to: 'pages#home', as: :home
  get '/perfil', to: 'pages#perfil', as: :perfil
  get '/documentation', to: 'pages#documentation', as: :documentation
  devise_for :users

  scope 'quizzes/' do
    get 'new', to: 'quizzes#new', as: :new_quiz
    post 'new', to:  "quizzes#create"
    get 'edit/:quiz_id', to: 'quizzes#edit', as: :edit_quiz
    patch 'update/:quiz_id', to: "quizzes#update"
    get 'index', to: "quizzes#index", as: :index_quiz
    get 'show/:quiz_id', to: "quizzes#show", as: :show_quiz
    delete 'delete/:quiz_id', to: "quizzes#destroy", as: :destroy_quiz

    scope 'edit/:quiz_id/questions/' do
      get 'new', to: 'questions#new', as: :new_question
      post 'new', to: 'questions#create'
      delete 'delete/:question_id', to: "questions#destroy", as: :destroy_question
      get 'edit/:question_id', to: 'questions#edit', as: :edit_question
      put 'update/:question_id', to: "questions#update"

      scope 'edit/:question_id/alternatives/' do
        get 'new', to: 'alternatives#new', as: :new_alternative
        post 'new', to:  "alternatives#create"
        get 'edit/:alternative_id', to: 'alternatives#edit', as: :edit_alternative
        patch 'edit/:alternative_id', to: "alternatives#update"
        delete 'delete/:alternative_id', to: "alternatives#destroy", as: :destroy_alternative
      end
    end
  end
end
