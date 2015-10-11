require "rails_helper"

feature "user submits answer choices for a question", %{
  As an indecisive user
  I want to submit potential answer choices for my question
  So that I can receive a relevant query

  Acceptance Criteria:
  - [X] When submitting a question, I will see a form to enter answer choices
        for that question
  - [X] If I submit an invalid input, I will be notified of errors
  - [X] I may submit up to 3 answer choices
  - [X] Upon successfully entering my answer choices, I will be notified
        that my answer choices were submitted
  - [ ] I cannot submit the same answer choice twice for the same question
  - [ ] I will be taken to a page where I will receive a decision for
        my question
} do
  context "User submits question and" do
    let!(:question) { FactoryGirl.create(:question) }
    let!(:answer_fields) do
      [
        "question_choices_attributes_0_description",
        "question_choices_attributes_1_description",
        "question_choices_attributes_2_description"
      ]
    end

    scenario "successfully submits 3 different answer choices", js: true do
      visit root_path
      choices = ["Chinese food", "Italian food", "Vietnamese food"]

      fill_in "question_body", with: "What's for dinner?"
      click_link "Submit"

      fill_in_answers(choices)
      click_button "Create Question"

      expect(page).to have_content(choices[0])
      expect(page).to have_content(choices[1])
      expect(page).to have_content(choices[2])
    end

    scenario "submits answer choice that is too long", js: true do
      visit root_path
      super_long_choice = "Chinese food" * 30
      choices = [super_long_choice, "Italian food", "Vietnamese food"]

      fill_in "question_body", with: "What's for dinner?"
      click_link "Submit"

      fill_in_answers(choices)
      click_button "Create Question"

      expect(page).
        to have_content("Answer choice must be less than 140 characters")
      expect(page).
        to_not have_content("Answer choices successfully added")
    end
  end
end
