class QueriesController < ApplicationController
  respond_to :js, :html

  def update
    @question = Question.find(params[:question_id])
    @query = @question.query
    @query.user = current_user if current_user
    if @query.update(query_params)
      flash[:success] = "Response successfully added. Selection: #{@query.selected_choice.description}. Rating: #{@query.rating}"
    else
      flash[:errors] = @query.errors.full_messages.join(", ")
      render partial: "layouts/flash_js"
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
