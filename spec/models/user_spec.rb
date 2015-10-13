require "rails_helper"

describe User do
  describe "validations" do
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:email) }
    it { should have_many(:queries) }
  end
end
