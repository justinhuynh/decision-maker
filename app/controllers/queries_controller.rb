class QueriesController < ApplicationController
  def update
    @question = Question.find(params[:question_id])
    @query = @question.query
    @query.user = current_user if current_user
    if @query.update(query_params)
      render json: {
        message: "Response successfully added",
        choice: @query.selected_choice.description,
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
    params.require(:query).permit(:rating, :selected_choice_id)
  end
end
