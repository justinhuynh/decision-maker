class QuestionsController < ApplicationController
  def new
    @question = Question.new
    3.times do
      @question.choices.build
    end
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
    @choices = @question.choices
  end

  def edit
    @question = Question.find(params[:id])
    @choices = @question.choices
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:notice] = 'Question updated.'
      redirect_to @question
    else
      flash[:error] = @question.errors.full_messages
      render :edit
    end
  end

  protected

  def question_params
    params.require(:question).permit(
      :title,
      :body,
      choices_attributes: [:id, :description]
      )
  end
end
