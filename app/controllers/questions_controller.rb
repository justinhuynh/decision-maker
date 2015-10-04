class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "Question successfully added"
      redirect_to @question
    else
      flash[:warning] = @question.errors.full_messages.join(", ")
      render :new
    end
  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @choice = Choice.new
  end

  protected

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
