class InstanceChoicesController < ApplicationController
  def new
    @instance_choice = InstanceChoice.new
  end

  def create
    @instance_choice = InstanceChoice.new(instance_choice_params)
    if @instance_choice.save
      flash[:notice] = 'Answer choice successfully added'
      redirect_to @instance
    else
      flash[:error] = @question.errors.full_messages.join(' ')
      render :new
    end
  end

  protected

  def instance_choice_params
    params.require(:instance_choice).permit(:choice_id)
  end
end
