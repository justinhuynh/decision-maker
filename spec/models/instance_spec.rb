require 'rails_helper'

describe Instance do
  describe "validations" do
    it { should belong_to(:user) }
    it { should validate_presence_of(:question) }
    it { should belong_to(:question) }
    it { should have_many(:instance_choices) }
    it { should have_many(:choices) }
  end
end
