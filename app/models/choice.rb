class Choice < ActiveRecord::Base
  has_many :instance_choices
  has_many :instances, through: :instance_choices
  has_many :questions, through: :instances
  has_many :users, through: :instances

  validates :description, presence: { message: "Answer choice can't be blank" }
  validates :description, length: {
    maximum: 140,
    message: "Answer choice must be less than 140 characters"
  }
  validates :description, uniqueness: true
end
