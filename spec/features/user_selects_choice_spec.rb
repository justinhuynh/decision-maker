require "rails_helper"

feature "user submits a question", %{
  As an indecisive user
  I want to submit the choice I ultimately selected (user choice)
  So that I can rate the outcome from my choice

  Acceptance Criteria:
  - [ ] I can select only one of the choices for a question
  - [ ] Upon successfully entering my selected choice, I will see
        that my selection was recorded
} do
  context "User visits question and" do
    let!(:question) { FactoryGirl.create(:question_with_choices) }

    scenario "successfully submits selected choice" do
      visit question_path(question)
      select question.choices.first, from: "selected_choice"
      click_link "Submit Result"

      expect(page).to have_content("Result successfully submitted")
    end
  end
end
