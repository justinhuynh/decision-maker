class Question < ActiveRecord::Base
  has_many :choices
  has_many :queries

  validates :body, presence: { message: "Question can't be blank" }
  validates :body, length: {
    maximum: 140,
    message: "Question must be less than 140 characters"
  }

  accepts_nested_attributes_for :choices,
    reject_if: proc { |attributes| attributes["description"].blank?
  }

  def create_query
    queries.create!
  end

  def query
    queries.first
  end

  def recommendation
    create_query if query.nil?
    query.recommended_choice
  end

  def selection
    query.selected_choice
  end
end
