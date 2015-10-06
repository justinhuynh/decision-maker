Rails.application.routes.draw do
  devise_for :users
  root "questions#new"
  resources :questions, except: :delete do
    resources :question_responses
  end
end
