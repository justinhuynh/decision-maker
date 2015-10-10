class Recommender
  attr_reader :question, :user, :choices, :queries

  def initialize(question, user=nil)
    @question = question
    @choices = question.choices
    @queries = question.queries
    @user = user
  end

  def recommendation
    @choices.sample
  end
end
