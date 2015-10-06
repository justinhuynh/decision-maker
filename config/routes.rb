Rails.application.routes.draw do
  devise_for :users
  root "questions#new"

  resources :questions, only: [:new, :create, :show] do
    resources :instances, only: [:new, :create, :edit, :update, :show, :index]
  end
  resources :choices, only: [:new, :create, :index]
end
