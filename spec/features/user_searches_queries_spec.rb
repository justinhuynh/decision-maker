require "rails_helper"

feature "user searches own past queries", %{
  As an authenticated user
  I want to search through my past queries
  So that I can see how I made this decision in the past

  Acceptance Criteria
  - [ ] User fills in the search field
  - [ ] User is notified of successful search
  - [ ] User is notified of invalid inputs
  - [ ] User results based on search input
} do
  let!(:user) { FactoryGirl.create(:user) }

  let!(:queries_1) do
    FactoryGirl.create_list(:query, 2, user: user)
  end

  let!(:queries_2) do
    FactoryGirl.create_list(:other_query, 2, user: user)
  end

  scenario "User successfully uses the search function" do
    sign_in(user)
    visit dashboard_path
    Query.reindex
    fill_in "query", with: "brown cow"
    click_button "Go"

    expect(page).to have_content("Search Results")
    expect(page).to_not have_content(queries_1.first.body)
    expect(page).to have_content(queries_2.first.body)
  end

  scenario "User enters blank search input" do
    sign_in(user)
    visit dashboard_path
    fill_in "query", with: ""
    click_button "Go"

    expect(page).to have_content("Search field can't be empty")
    expect(page).to_not have_content("Search Results")
  end
end
