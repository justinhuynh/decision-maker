require "rails_helper"

describe QuestionResponse do
  describe "validations" do
    it { should validate_presence_of(:question) }
    it { should validate_presence_of(:choice) }
    it { should validate_presence_of(:rating) }
    it { should validate_inclusion_of(:rating).in_range(0..10) }
    it { should belong_to(:user) }
    it { should belong_to(:question) }
    it { should belong_to(:choice) }
  end
end
