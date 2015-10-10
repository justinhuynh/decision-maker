require "rails_helper"

describe Query do
  describe "validations" do
    it { should validate_presence_of(:question) }
    it { should validate_inclusion_of(:rating).in_range(0..10) }
    it { should_not have_valid(:rating).when(nil, "", -42, "potato") }
    it { should belong_to(:user) }
    it { should belong_to(:question) }
    it { should belong_to(:selected_choice) }
    it { should belong_to(:recommended_choice) }
  end

  describe "methods" do
    let!(:question) { FactoryGirl.create(:question, :with_query) }
    let!(:query) { question.queries.first }

    it "can return a recommended choice" do
      recommendation = query.recommended_choice

      expect(recommendation).to be_a(Choice)
      expect(question.choices.include?(recommendation)).to eq(true)
    end

    it "recommended choice does not change after it is set" do
      previous_rec = query.recommended_choice
      1000.times do
        new_rec = query.recommended_choice
        expect(previous_rec == new_rec).to eq(true)
      end
    end
  end
end
