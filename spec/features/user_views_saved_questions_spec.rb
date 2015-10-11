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
    let(:user) { FactoryGirl.create(:user) }

    scenario "and has link to dashboard" do
  #   sign_in(user)
  #   within("nav#top-bar") do
  #     click_link "Dashboard"
  #   end
  #   expect(page).to have_content("#{user.first_name}'s Dashboard")
    end
  end
end
