require 'rails_helper'

feature "user submits answer choices for a question", %{
  As an indecisive user
  I want to submit potential answer choices for my question
  So that I can receive a relevant response

  Acceptance Criteria:
  - [ ] After submitting a question, I will see a form to enter answer choices
        for that question
  - [ ] If I submit an invalid input, I will be notified of errors
  - [ ] I must submit at least 2 and no more than 4 answer choices
  - [ ] Upon successfully entering my answer choices, I will be notified
        that my answer choices were submitted
  - [ ] I cannot submit the same answer choice twice for the same question
  - [ ] I will be taken to a page where I will receive a decision for
        my question
} do
  context "User submits question and" do
    let!(:question) = FactoryGirl.build_stubbed(:question)

    scenario "successfully submits 3 different answer choices" do
      visit question_path(question)
      choices = ["Chinese food", "Italian food", "Vietnamese food"]

      fill_in "Answer Choice 1", with: choices[0]
      fill_in "Answer Choice 2", with: choices[1]
      fill_in "Answer Choice 3", with: choices[2]
      click_button "Submit Choices"

      expect(page).to have_content("Answer choices successfully added")
      expect(page).to have_content(choices[0])
      expect(page).to have_content(choices[1])
      expect(page).to have_content(choices[2])
    end

    scenario "submits answer choice that is too long" do
      visit question_path(question)
      choices = ["Chinese food", "Italian food", "Vietnamese food"]
      super_long_choice = choice[0] * 30

      fill_in "Answer Choice 1", with: super_long_choice
      fill_in "Answer Choice 2", with: choices[1]
      fill_in "Answer Choice 3", with: choices[2]
      click_button "Submit Choices"

      expect(page).to have_content("Answer choice 1 must be less than 140 characters")
      expect(page).to_not have_content("Answer choices successfully added")
    end

    scenario "submits only one answer choice" do
      visit question_path(question)
      choices = ["Chinese food", "Italian food", "Vietnamese food"]

      fill_in "Answer Choice 1", with: choices[0]
      click_button "Submit Choices"

      expect(page).to have_content("Must have at least two answer choices")
      expect(page).to_not have_content("Answer choices successfully added")
    end

    scenario "submits the same answer choice twice" do
      visit question_path(question)
      choices = ["Chinese food", "Italian food", "Vietnamese food"]

      fill_in "Answer Choice 1", with: choices[0]
      fill_in "Answer Choice 2", with: choices[0]
      click_button "Submit Choices"

      expect(page).to have_content("Cannot have the same answer choice twice")
      expect(page).to_not have_content("Answer choices successfully added")
    end
  end
end
