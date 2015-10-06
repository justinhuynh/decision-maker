require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :question do
    sequence(:body) { |n| "#{n} What should I have for lunch?" }
  end

  factory :choice do
    sequence(:description) { |n| "#{n} this is just an option" }
    question
  end
end
