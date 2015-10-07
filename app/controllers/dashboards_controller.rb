class DashboardsController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @responses = @question.responses
  end
end
