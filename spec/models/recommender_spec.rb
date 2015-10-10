require "rails_helper"

describe Recommender do
  let!(:question) do
    FactoryGirl.create(:question, :with_query, body: "What should I have for dinner?")
  end
  # end
  # let!(:choices) { FactoryGirl.create_list(:choice, 3, question: question) }
  # let!(:query) do
  #   FactoryGirl.create_list(
  #     :query,
  #     10,
  #     selected_choice: choices.sample,
  #     recommended_choice: choices.sample,
  #     question: question
  #     )
  # end
  let!(:recommendation) { Recommender.new(question) }

  it "gets ratings for all choices, given a question and optionally a user" do
    expect(recommendation.question).to be_a(Question)
    expect(recommendation.question.body).to eq("What should I have for dinner?")
    expect(recommendation.choices.count).to eq(3)
  end

  it "returns a recommended choice for a given question" do
    expect(recommendation.recommendation).to be_a(Choice)
    expect(recommendation.recommendation.question).to eq(question)
  end
end
