Rails.application.routes.draw do
  root to: "pages#home"
  resources :services
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users, controllers: {
    registration: 'users/registrations'
  }
end
