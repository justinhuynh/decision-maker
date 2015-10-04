require 'rails_helper'

describe Instance do
  describe "validations" do
    it { should validate_presence_of(:user) }
    it { should belong_to(:user) }
    it { should validate_presence_of(:question) }
    it { should belong_to(:question) }
  end
end
