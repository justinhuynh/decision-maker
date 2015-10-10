class DashboardsController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @queries = @question.queries
  end
end
