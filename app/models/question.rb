class Question < ActiveRecord::Base
  has_many :instances
  has_many :users, through: :instances
  has_many :instance_choices, through: :instances
  has_many :choices, through: :instance_choices

  validates :body, presence: { message: "Question can't be blank" }
  validates :body, length: {
    maximum: 140,
    message: "Question must be less than 140 characters"
  }
end
