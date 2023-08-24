Rails.application.routes.draw do
  resources :produtos
  resources :posts, only: [:index, :show, :create, :new, :destroy]
  devise_for :users
  root to: "pages#home"
  get "ceo", to: "pages#ceo"
  get "servicos", to: "pages#servicos"
  get "sobre", to: "pages#sobre"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
