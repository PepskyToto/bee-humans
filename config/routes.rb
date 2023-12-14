Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :bookmarks, only: [:index, :create, :destroy]
  resources :reviews, only: [:index, :create, :destroy]
  resources :messages, only: [:index, :create, :destroy]
  resources :users_skills, only: [:index, :create, :destroy]
  resources :users, only: [:show, :edit, :index]

  resources :skills

  resources :requests do
    resources :chatrooms , only: [:show,:create]
  end

  resources :chatrooms, only: [:index,:destroy] do
    resources :messages, only: [:create]
  end

end
