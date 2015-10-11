require "rails_helper"

feature "authenticated user views saved questions", %{
  As an authenticated user
  I would like to see my previous questions and responses
  So I can understand how I responded to this question in the past

  Acceptance Criteria:
  - [ ] If I am authenticated when entering a question, my questions and
        responses will be saved
  - [ ] I can view my past questions, responses, recommendations and outcomes
} do
  context "Authenticated user signs in" do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:queries) { FactoryGirl.create_list(:query, 10, user: user) }

    scenario "and has link to dashboard" do
      sign_in(user)

      within("nav.top-bar") do
        click_link "Dashboard"
      end

      expect(page).to have_content("#{user.first_name}'s Dashboard")
    end

    scenario "user can view a list of saved questions" do
      sign_in(user)
      visit dashboard_path

      expect(page).to have_content(queries[0].question.body)
      expect(page).to have_content(queries[1].selected_choice.description)
      expect(page).to have_content(queries[2].recommended_choice.description)
      expect(page).to have_content(queries[3].rating)
      expect(page).to have_content(queries[8].question.body)
    end
  end
end
