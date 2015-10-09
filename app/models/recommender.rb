class Recommender
  attr_reader :question, :user, :choices, :responses

  def initialize(question, user=nil)
    @question = question
    @choices = question.choices
    @responses = question.responses
    @user = user
  end

  def selected_choice
    @choices.sample
  end
end
