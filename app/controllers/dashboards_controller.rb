class DashboardsController < ApplicationController
  before_action :authenticate_user!, :set_user

  def show
    @queries = @user.queries.page(params[:page]).per(10)
  end

  def search
    @queries = @user.search(search_params).page(params[:page]).per(10)
    if search_params.empty?
      flash[:warning] = "Search field can't be empty"
      render :show
    else
      flash[:success] = "Your search returned #{@queries.count} results"
      render :search
    end
  end

  protected

  def set_user
    @user = current_user
  end

  def search_params
    params.permit(:search)[:search]
  end
end
