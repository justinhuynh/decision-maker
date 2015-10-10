require "rails_helper"

feature "user receives a recommendation from app", %{
  As an indecisive user
  I want to receive a query to my question
  So that I can take action on my decision

  Acceptance Criteria:
  - [ ] The application recommends a choice from the options I
        submitted for this question
  - [ ] I will see this after submitting the question
} do
  context "User submits question with choices", js: true do
    let!(:question) { FactoryGirl.create(:question, :with_queries) }
    let!(:recommendation) { question.recommendation }

    scenario "and is able to see a recommended choice" do
      visit question_path(recommendation.question)

      expect(page).to have_content("Your recommended choice is #{recommendation.description}")
    end
  end
end
