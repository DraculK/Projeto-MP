Rails.application.routes.draw do
  root to: 'pages#home', as: :home
  get '/perfil', to: 'pages#perfil', as: :perfil
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
