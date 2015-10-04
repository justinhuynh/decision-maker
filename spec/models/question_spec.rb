require 'rails_helper'

describe Question do
  describe "validations" do
    it { should validate_presence_of(:body).with_message("Question can't be blank") }
    it { should validate_length_of(:body).is_at_most(140).with_message("Question must be less than 140 characters") }
  end
end
