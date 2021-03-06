class QuestionsController < ApplicationController
  respond_to :js

  def new
    @question = Question.new
    2.times do
      @question.choices.build
    end
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      @question.create_query
      flash[:success] = "Question successfully added"
      @choices = @question.choices
      @recommendation = @question.recommendation
    else
      flash[:warning] = @question.errors.full_messages.join(", ")
      render partial: "layouts/errors"
    end
  end

  def show
    @question = Question.find(params[:id])
    @choices = @question.choices
    @recommendation = @question.recommendation
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
