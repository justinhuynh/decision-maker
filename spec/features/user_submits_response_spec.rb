require "rails_helper"

feature "user submits a response", %{
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
    let!(:question) { FactoryGirl.create(:question, :with_choices) }
    let!(:choices) { question.choices.map(&:description) }

    scenario "successfully submits selected choice", js: true do
      visit root_path
      fill_in_question(question.body)
      fill_in_answers(choices)
      click_button "Create Question"
      find("#recommendation")

      click_link question.choices.first.description
      click_link "Submit Response"

      find(".flash-success")
      expect(page).to have_content("Response successfully added")
    end
  end
end
