require "rails_helper"

describe Recommender do
  let!(:question) do
    FactoryGirl.create(:question, body: "What should I have for dinner?")
  end
  let!(:choices) { FactoryGirl.create_list(:choice, 3, question: question) }
  let!(:responses) do
    FactoryGirl.create_list(
      :response,
      10,
      choice: choices.sample,
      question: question
      )
  end
  let!(:recommendation) { Recommender.new(question) }

  it "gets ratings for all choices, given a question and optionally a user" do
    expect(recommendation.question).to be_a(Question)
    expect(recommendation.question.body).to eq("What should I have for dinner?")
    expect(recommendation.choices.count).to eq(3)
    expect(recommendation.responses.count).to eq(10)
  end

  it "returns a recommended choice for a given question" do
    expect(recommendation.recommendation).to be_a(Choice)
    expect(recommendation.recommendation.question).to eq(question)
  end
end
