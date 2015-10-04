class Question < ActiveRecord::Base
  validates :body, presence: { message: "Question can't be blank" }
  validates :body, length: {
    maximum: 140,
    message: "Question must be less than 140 characters"
  }
end
