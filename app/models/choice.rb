class Choice < ActiveRecord::Base
  searchkick
  belongs_to :question

  validates :description, presence: { message: "Answer choice can't be blank" }
  validates :description, length: {
    maximum: 140,
    message: "Answer choice must be less than 140 characters"
  }
end
