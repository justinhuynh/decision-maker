Rails.application.routes.draw do
  devise_for :users
  root "questions#new"
  resources :questions do
    resources :choices
  end
end
