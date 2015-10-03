require 'rails_helper'

feature 'user submits a question', %{
  As an indecisive user
  I want to submit a question
  So that I can get help with a decision

  Acceptance Criteria:
  - [ ] I will see a field to enter my question on the homepage
  - [ ] If I submit an invalid input, I will be notified of errors
  - [ ] Upon successfully entering my question, I will be notified that my question was submittted
  - [ ] I will be redirected to a page that shows my question and a form to enter potential answer choices
} do
  context "User visits homepage and" do
    setup { visit root_path }

    scenario "successfully submits question on homepage" do
      question = "What should I have for lunch?"

      fill_in 'Question', with: question
      click_button 'Submit'

      expect(page).to have_content(question)
      expect(page).to have_content("Question successfully submitted")
      expect(page).to have_content("answer choices")
    end

    scenario "submits question that is too long" do
      super_long_question = "What should I have for lunch?" * 20

      fill_in 'Question', with: super_long_question
      click_button 'Submit'

      expect(page).to have_content("What should I have for lunch?")
      expect(page).to have_content("Question is longer than 140 characters")
    end

    scenario "submits blank question" do
      fill_in 'Question', with: ''
      click_button 'Submit'

      expect(page).to have_content("Question cannot be blank")
    end
  end
end
