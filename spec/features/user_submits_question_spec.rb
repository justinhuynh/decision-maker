require "rails_helper"

feature "user submits a question", %{
  As an indecisive user
  I want to submit a question
  So that I can get help with a decision

  Acceptance Criteria:
  - [X] I will see a field to enter my question on the homepage
  - [X] If I submit an invalid input, I will be notified of errors
  - [X] Upon successfully entering my question, I will be notified
        that my question was submitted
  - [X] I will be redirected to a page that shows my question
        and answer choices
} do
  context "User visits homepage and" do
    scenario "successfully submits question on homepage", js: true do
      visit root_path
      question = "What should I have for lunch?"

      fill_in "question_body", with: question
      find(".question-input").native.send_keys(:return)
      fill_in_answers
      click_button "Create Question"

      expect(page).to have_content(question)
      expect(page).to have_content("Question successfully added")
    end

    scenario "submits question that is too long", js: true do
      visit root_path
      super_long_question = "What should I have for lunch?" * 20

      fill_in "question_body", with: super_long_question
      find(".question-input").native.send_keys(:return)
      fill_in_answers
      click_button "Create Question"

      expect(page).to have_content("Question must be less than 140 characters")
    end

    scenario "submits blank question", js: true do
      visit root_path
      fill_in "question_body", with: ""
      find(".question-input").native.send_keys(:return)

      fill_in_answers
      click_button "Create Question"

      expect(page).to have_content("Question can't be blank")
    end
  end
end
