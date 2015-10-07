require "rails_helper"

feature "user submits a question", %{
  As an indecisive user
  I want to submit and rate the choice I ultimately selected (user choice)
  So that I can track the results of my choices

  Acceptance Criteria:
  - [X] I can select only one of the choices for a question
  - [X] I will be notified if I enter invalid inputs
  - [X] Upon successfully entering my selected choice, I will see
        that my selection was recorded
} do
  context "User visits question and" do
    let!(:question) { FactoryGirl.create(:question_with_choices) }

    scenario "successfully submits selected choice" do
      visit question_path(question)
      fill_in "Rating", with: 5
      select question.choices.first.description, from: "response_choice_id"
      click_button "Create Response"

      expect(page).to have_content("Response successfully added")
    end

    scenario "submits invalid response inputs" do
      visit question_path(question)
      fill_in "Rating", with: "asdf"
      select question.choices.first.description, from: "response_choice_id"
      click_button "Create Response"

      expect(page).to_not have_content("Response successfully added")
      expect(page).to have_content("Rating is not a number")
    end
  end
end
