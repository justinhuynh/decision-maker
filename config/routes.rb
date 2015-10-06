Rails.application.routes.draw do
  devise_for :users
  root "questions#new"

  resources :questions, only: [:new, :create, :show, :index]
  resources :instances, only: [:new, :create, :edit, :update, :show, :index] do
    resources :choices, only: [:new, :create, :index]
  end
end
