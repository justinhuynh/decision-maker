class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.find_or_create_by(question_params)
    @instance = Instance.create(instance_attributes)
    if @question.save
      flash[:success] = "Question successfully added"
      redirect_to @instance
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
    @instances = @question.instances
  end

  protected

  def instance_attributes
    if current_user
      return { user: current_user, question: @question }
    else
      { question: @question }
    end
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
