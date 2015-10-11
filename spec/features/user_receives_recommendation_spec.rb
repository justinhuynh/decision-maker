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
    let!(:question) { FactoryGirl.create(:question, :with_choices) }
    let!(:choices) { question.choices.map(&:description) }

    scenario "and is able to see a recommended choice" do
      visit root_path
      fill_in_question(question.body)
      fill_in_answers(choices)
      click_button "Create Question"
      find("#recommendation")

      recommendation_text = find("#rec-desc").text

      expect(choices.include?(recommendation_text)).to eq(true)
      expect(page).to have_content(
        "Your recommended choice is #{recommendation_text}"
      )
    end
  end
end
