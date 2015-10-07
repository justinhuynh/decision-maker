class ResponsesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @response = Response.new(response_params)
    @response.question = @question
    @response.user = current_user if current_user
    if @response.save
      flash[:notice] = "Response successfully added"
      redirect_to @question
    else
      flash[:error] = @response.errors.full_messages.join(" ")
      redirect_to @question
    end
  end

  protected

  def response_params
    params.require(:response).permit(:rating, :choice_id)
  end
end
