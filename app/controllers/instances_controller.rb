class InstancesController < ApplicationController
  def new
    # @question = Question.find(params[:question_id])
    # @instance = Instance.new
  end

  def create
    # @question = Question.find(params[:question_id])
    # @instance = Instance.new(instance_params)
    # if @instance.save
    #   flash[:notice] = 'Instance successfully saved'
    #   redirect_to @instance
    # else
    #   flash[:error] = @instance.errors.full_messages.join(' ')
    #   redirect_to @instance
    # end
  end

  def index

  end

  def show
    @instance = Instance.find(params[:id])
    4.times do
      @choice = @instance.instance_choices.build #.build_choice
    end
  end

  def update
    # binding.pry
  end

  protected

  def instance_params
    params.require(:instance).permit(
      :outcome_rating,
      instance_choices_attributes: [
        choice_attributes: [:description]]
      )
  end
end
