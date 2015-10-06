class Question < ActiveRecord::Base
  has_many :choices
  validates :body, presence: { message: "Question can't be blank" }
  validates :body, length: {
    maximum: 140,
    message: "Question must be less than 140 characters"
  }
  accepts_nested_attributes_for :choices,
                                reject_if: proc { |attributes| attributes['description'].blank? }
end
