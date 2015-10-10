class QueriesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @query = query.new(query_params)
    @query.question = @question
    @query.user = current_user if current_user
    if @query.save
      render json: {
        message: "query successfully added",
        choice: @query.choice.description,
        rating: @query.rating
      }
    else
      render json: {
        message: @query.errors.full_messages.join(", ")
      }
    end
  end

  def index
    @question = Question.find(params[:question_id])
    @queries = @question.queries
  end

  protected

  def query_params
    params.require(:query).permit(:rating, :choice_id)
  end
end
