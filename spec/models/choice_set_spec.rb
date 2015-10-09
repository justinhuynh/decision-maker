require "rails_helper"

describe ChoiceSet do
  describe "validations" do
    it { should validate_presence_of(:question) }
    it { should validate_presence_of(:choice) }
    it { should belong_to(:question) }
    it { should belong_to(:choice) }
  end
end
