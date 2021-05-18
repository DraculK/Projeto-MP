Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  
  scope 'alternatives/' do
    get 'new', to: 'alternatives#new', as: :new_alternative
    post 'create', to:  "alternatives#create"
    get 'edit/:id', to: 'alternatives#edit', as: :edit_alternative
    patch 'edit/:id', to: "alternatives#update"
    delete 'delete/:id', to: "alternatives#delete", as: :destroy_alternative
  end

  scope 'questions/' do
    get 'new', to: 'questions#new', as: :new_question
    post 'create', to: 'questions#create'
    get 'index', to: "questions#index", as: :index_question
    get 'show/:id', to: 'questions#show', as: :show_question
    delete "delete/:id", to: "questions#delete", as: :destroy_question
    get 'edit/:id', to: 'questions#edit', as: :edit_question
    put "update/:id", to: "questions#update"
  end

  scope 'quizzes/' do
    get 'new', to: 'quizzes#new', as: :new_quiz
    post 'create', to:  "quizzes#create"
    get 'edit/:id', to: 'quizzes#edit', as: :edit_quiz
    patch 'update/:id', to: "quizzes#update"
    get 'index', to: "quizzes#index", as: :index_quiz
    get 'show/:id', to: "quizzes#show", as: :show_quiz
    delete 'delete/:id', to: "quizzes#delete", as: :destroy_quiz
  end
end
