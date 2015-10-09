class Recommender
  attr_reader :question, :user, :choices, :responses

  def initialize(question, user=nil)
    @question = question
    @choices = question.choices
    @responses = question.responses
    @user = user
  end

  def recommendation
    @choices.sample
  end
end
