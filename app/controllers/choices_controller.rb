class ChoicesController < ApplicationController
  def new
    @choice = Choice.new
  end

  def create
    binding.pry
    @choice = Choice.new(choice_params)
    if @choice.save
      flash[:notice] = 'Answer choice successfully added'
      redirect_to choices_path
    else
      flash[:error] = @question.errors.full_messages.join(' ')
      render :new
    end
  end

  def index
    @choices = Choice.all
  end

  protected

  def choice_params
    params.require(:choice).permit(:description)
  end
end
