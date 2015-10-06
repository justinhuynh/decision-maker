class QuestionResponse < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  belongs_to :choice

  validates :question, presence: true
  validates :choice, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 0..10 }
end
