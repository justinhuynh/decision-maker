require "faker"

interrogatives = ["Who", "What", "When", "Where", "Why", "Which", "How"]
nouns = []
verbs = []
choices = []
20.times { nouns << Faker::Hacker.noun }
20.times { verbs << Faker::Hacker.verb }
50.times { choices << Faker::Commerce.product_name }

5.times do
  user_attributes = {
    email: "#{Faker::Internet.email}",
    first_name: "#{Faker::Name.first_name}",
    last_name: "#{Faker::Name.last_name}",
    password: "password",
    password_confirmation: "password"
  }
  User.create!(user_attributes)
end

300.times do
  question_attributes = {
    body: "#{interrogatives.sample} #{verbs.sample} #{nouns.sample}"
  }
  question = Question.create!(question_attributes)
  3.times do
    Choice.create!(
      question: question,
      description: "#{choices.sample}"
    )
  end
  query_attributes = {
    question: question,
    user: User.all.sample,
    rating: rand(0..10),
    selected_choice: question.choices.sample,
    recommended_choice: question.recommendation
  }
  Query.create!(query_attributes)
end
