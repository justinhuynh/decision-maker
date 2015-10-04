require 'rails_helper'

describe InstanceChoice do
  describe "validations" do
    it { should validate_presence_of(:instance) }
    it { should belong_to(:instance) }
    it { should validate_presence_of(:choice) }
    it { should belong_to(:choice) }
    subject { FactoryGirl.build(:instance_choice) }
    it { should validate_uniqueness_of(:instance_id).scoped_to(:choice_id) }
  end
end
