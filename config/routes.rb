Rails.application.routes.draw do
  devise_for :users
  root "questions#new"
  resources :questions, except: :delete do
    resources :responses
  end
end
