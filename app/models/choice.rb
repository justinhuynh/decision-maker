class Choice < ActiveRecord::Base
  belongs_to :question
  # has_many :queries, through: :question

  validates :description, presence: { message: "Answer choice can't be blank" }
  validates :description, length: {
    maximum: 140,
    message: "Answer choice must be less than 140 characters"
  }
end
