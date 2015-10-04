require 'rails_helper'

describe User do
  describe "validations" do
    it { should have_many(:questions) }
    it { should have_many(:instances) }
    it { should have_many(:choices) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end
end
