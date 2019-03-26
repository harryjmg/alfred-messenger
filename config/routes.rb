Rails.application.routes.draw do
  get 'users/index'

  root "pages#index"

  get '/about', to: "pages#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Facebook::Messenger::Server, at: "bot"
  resources :flow_entries

  post '/typeform', to: "typeform#webhook"
end
