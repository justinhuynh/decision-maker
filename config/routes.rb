Rails.application.routes.draw do
  devise_for :users
  root "questions#new"
  resources :questions, except: :delete do
    resources :queries
  end
end
