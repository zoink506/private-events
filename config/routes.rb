Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "events#index"

  resources :events, only: [:index, :show, :new, :create, :destroy, :edit, :update]
  resources :users, only: [:show]
  resources :enrollments, only: [:create]
end
