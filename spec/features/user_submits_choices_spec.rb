require "rails_helper"

feature "user submits answer choices for a question", %{
  As an indecisive user
  I want to submit potential answer choices for my question
  So that I can receive a relevant response

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

    scenario "successfully submits 3 different answer choices" do
      visit root_path
      choices = ["Chinese food", "Italian food", "Vietnamese food"]

      fill_in "Question", with: "What's for dinner?"
      fill_in answer_fields[0], with: choices[0]
      fill_in answer_fields[1], with: choices[1]
      fill_in answer_fields[2], with: choices[2]
      click_button "Create Question"

      expect(page).to have_content(choices[0])
      expect(page).to have_content(choices[1])
      expect(page).to have_content(choices[2])
    end

    scenario "submits answer choice that is too long" do
      visit root_path
      choices = ["Chinese food", "Italian food", "Vietnamese food"]
      super_long_choice = choices[0] * 30

      fill_in "Question", with: "What's for dinner?"
      fill_in answer_fields[0], with: super_long_choice
      fill_in answer_fields[1], with: choices[1]
      fill_in answer_fields[2], with: choices[2]
      click_button "Create Question"

      expect(page).to have_content("Answer choice must be less than 140 characters")
      expect(page).to_not have_content("Answer choices successfully added")
    end
  end
end
