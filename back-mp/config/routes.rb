Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace :v1 do
      post 'sign_in', to: "sessions#sign_in"

      post '/alternative/create', to:  "alternatives#create", as: :create_alternative
      patch '/alternative/:id', to: "alternatives#update", as: :update_alternative
      get '/alternatives', to: "alternatives#index", as: :alternatives
      get '/alternative/:id', to: "alternatives#show", as: :show_alternative
      delete '/alternative/:id', to: "alternatives#delete", as: :destroy_alternative
    end
  end
end
