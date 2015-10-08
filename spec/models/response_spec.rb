require "rails_helper"

describe Response do
  describe "validations" do
    it { should validate_presence_of(:question) }
    it { should validate_presence_of(:choice) }
    it { should validate_presence_of(:rating) }
    it { should validate_inclusion_of(:rating).in_range(0..10) }
    it { should_not have_valid(:rating).when(nil, "", -42, "potato") }
    it { should belong_to(:user) }
    it { should belong_to(:question) }
    it { should belong_to(:choice) }
  end
end
