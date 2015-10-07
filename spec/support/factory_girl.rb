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
  end

  factory :question do
    sequence(:body) { |n| "#{n} What should I have for lunch?" }

    factory :question_with_choices do
      after(:create) do |question|
        FactoryGirl.create(:choice, question: question)
        FactoryGirl.create(:choice, question: question)
        FactoryGirl.create(:choice, question: question)
      end
    end

  end

  factory :response do
    choice
    question
    rating 3
  end
end
