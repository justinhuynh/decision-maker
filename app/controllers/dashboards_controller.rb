class DashboardsController < ApplicationController
  before_action :authenticate_user!, :set_user

  def show
    @queries = @user.queries #.page(params[:page]).per(10)
  end

  def search
    @queries = Query.search(
      search_params[:query],
      where: { user_id: current_user.id } #,
      #page: params[:page], per_page: 10
    )
    if search_params[:query].empty?
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
    params.permit(:query)
  end
end
