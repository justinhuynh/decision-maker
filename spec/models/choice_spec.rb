require 'rails_helper'

describe Choice do
  describe "validations" do
    it do
      should validate_presence_of(:description).
        with_message("Answer choice can't be blank")
    end
    it do
      should validate_length_of(:description).
        is_at_most(140).
        with_message("Answer choice must be less than 140 characters")
    end
    it do
      should validate_uniqueness_of(:description)
    end
    it { should have_many(:questions) }
    it { should have_many(:instances) }
    it { should have_many(:users) }
  end
end
