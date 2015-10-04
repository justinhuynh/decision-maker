require 'rails_helper'

feature 'user submits a question', %{
  As an indecisive user
  I want to submit a question
  So that I can get help with a decision

  Acceptance Criteria:
  - [X] I will see a field to enter my question on the homepage
  - [ ] If I submit an invalid input, I will be notified of errors
  - [ ] Upon successfully entering my question, I will be notified that my question was submittted
  - [ ] I will be redirected to a page that shows my question and a form to enter potential answer choices
} do
  context "User visits homepage and" do
    scenario "successfully submits question on homepage" do
      visit root_path
      question = "What should I have for lunch?"

      fill_in 'Question', with: question
      click_button 'Create Question'

      expect(page).to have_content(question)
      expect(page).to have_content("Question successfully added")
      expect(page).to have_content("answer choices")
    end

    scenario "submits question that is too long" do
      visit root_path
      super_long_question = "What should I have for lunch?" * 20

      fill_in 'Question', with: super_long_question
      click_button 'Create Question'

      expect(page).to have_content("Question must be less than 140 characters")
    end

    scenario "submits blank question" do
      visit root_path
      fill_in 'Question', with: ''
      click_button 'Create Question'

      expect(page).to have_content("Question can't be blank")
    end
  end
end
