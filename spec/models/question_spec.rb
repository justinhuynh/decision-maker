require "rails_helper"

describe Question do
  describe "validations" do
    it do
      should validate_presence_of(:body).
        with_message("Question can't be blank")
    end
    it do
      should validate_length_of(:body).
        is_at_most(140).
        with_message("Question must be less than 140 characters")
    end
    it { should have_many(:choices) }
    it { should have_many(:responses) }
  end

  describe "methods" do
    let!(:question) { FactoryGirl.create(:question, :with_responses) }

    it "can return a recommended choice" do
      recommendation = question.recommendation

      expect(recommendation).to be_a(Choice)
      expect(question.choices.include?(recommendation)).to eq(true)
    end

    it "recommended choice does not change once it is set" do
      previous_rec = question.recommendation.id
      1000.times do
        new_rec = question.recommendation.id
        expect(previous_rec == new_rec).to eq(true)
      end
    end
  end
end
