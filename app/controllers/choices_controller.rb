class ChoicesController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @choice = Choice.new
  end

  def create
    @question = Question.find(params[:question_id])
    @choice = Choice.new(choice_params)
    @question.choice = @choice
    if @choice.save
      flash[:notice] = 'Answer choice successfully added'
      redirect_to choices_path
    else
      flash[:error] = @question.errors.full_messages.join(' ')
      render :new
    end
  end

  def index
    @question = Question.find(params[:question_id])
    @choices = @question.choices
  end

  protected

  def choice_params
    params.require(:choice).permit(:description)
  end
end
