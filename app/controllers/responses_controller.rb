class ResponsesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @response = Response.new(response_params)
    @response.question = @question
    @response.user = current_user if current_user
    render json: {
      message: "Response successfully added"
    }
  end

  protected

  def response_params
    params.require(:response).permit(:rating, :choice_id)
  end
end
