class ChoiceSet < ActiveRecord::Base
  belongs_to :question
  belongs_to :choice

  validates :question, presence: true
  validates :choice, presence: true
end
