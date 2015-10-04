class Instance < ActiveRecord::Base
  has_many :instance_choices
  has_many :choices, through: :instance_choices
  belongs_to :user
  belongs_to :question

  validates :user, presence: true
  validates :question, presence: true
  validates :outcome_rating, numericality: { only_integer: true }, allow_blank: true
  validates :outcome_rating, inclusion: { in: 1..5 }, allow_blank: true
end
