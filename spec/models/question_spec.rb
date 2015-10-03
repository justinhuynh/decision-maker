require 'rails_helper'

describe Question do
  describe "validations" do
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_most(140) }
  end
end
