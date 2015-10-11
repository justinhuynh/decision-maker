Rails.application.routes.draw do
  devise_for :users
  root "questions#new"
  resources :questions, only: [:new, :create, :show] do
    resources :queries, only: [:update, :index]
  end

  get "/dashboard", to: "dashboards#show", as: "dashboard"
end
