class ResponsesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @response = Response.new(response_params)
    @response.question = @question
    @response.user = current_user if current_user
    if @response.save
      render json: {
        message: "Response successfully added",
        choice: @response.choice.description,
        rating: @response.rating
      }
    else
      render json: {
        message: @response.errors.full_messages.join(", ")
      }
    end
  end

  def index
    @question = Question.find(params[:question_id])
    @responses = @question.responses
  end

  protected

  def response_params
    params.require(:response).permit(:rating, :choice_id)
  end
end
