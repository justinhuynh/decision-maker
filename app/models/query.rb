class Query < ActiveRecord::Base
  after_create :set_recommendation

  belongs_to :user
  belongs_to :question
  belongs_to :selected_choice, class_name: "Choice"
  belongs_to :recommended_choice, class_name: "Choice"

  validates :question, presence: true
  validates :rating, numericality: { only_integer: true, allow_nil: true }
  validates :rating, inclusion: { in: 0..10, allow_nil: true }

  private

  def set_recommendation
    recommender = Recommender.new(question)
    update_attributes(recommended_choice: recommender.recommendation)
  end
end
