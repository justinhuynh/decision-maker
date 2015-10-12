require "rails_helper"

describe User do
  describe "validations" do
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:email) }
    it { should have_many(:queries) }
  end
  describe "methods" do

    let!(:user) { FactoryGirl.create(:user) }

    let!(:queries_1) do
      FactoryGirl.create_list(:query, 2, user: user)
    end

    let!(:queries_2) do
      FactoryGirl.create_list(:other_query, 2, user: user)
    end

    it "can return questions matching input text for user" do
      expect(user.search("brown").count).to eq(2)
    end

    it "returns query objects as search results" do
      expect(user.search("brown").first).to be_a(Query)
    end
  end
end
