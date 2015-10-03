class Question < ActiveRecord::Base
  validates :body, presence: true
  validates :body, length: { maximum: 140 }
end
