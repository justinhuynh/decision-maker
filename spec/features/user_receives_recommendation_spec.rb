require "rails_helper"

feature "user receives a recommendation from app", %{
  As an indecisive user
  I want to receive a response to my question
  So that I can take action on my decision

  Acceptance Criteria:
  - [ ] The application recommend a choice
  - [ ] I will see this after submitting the question
} do
  context "User submits question with choices", js: true do
    let!(:question) { FactoryGirl.create(:question_with_choices) }

    scenario "and is able to see a recommended choice" do
      # visit root_path
      # fill_in_question
      # fill_in_answers
      #
      # click_link "Create Question"
      # expect(page).to have_content("Your recommended choice is")
      #
    end
  end
end
