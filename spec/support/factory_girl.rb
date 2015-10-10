require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :choice do
    sequence(:description) { |n| "#{n} this is just an option" }
    question

    factory :selected_choice
    factory :recommended_choice
  end

  factory :question do
    sequence(:body) { |n| "#{n} What should I have for lunch?" }

    trait :with_choices do
      after(:create) do |question|
        create_list(:choice, 3, question: question)
      end
    end

    trait :with_queries do
      with_choices
      after(:create) do |question|
        create_list(:query, 10, selected_choice: question.choices.sample, recommended_choice: question.choices.sample)
      end
    end
  end

  factory :query do
    selected_choice
    recommended_choice
    question
    rating { rand(0..10) }
  end
end
