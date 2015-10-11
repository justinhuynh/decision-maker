class DashboardsController < ApplicationController
  before_action :authenticate_user!, :set_user

  def show
    @queries = @user.queries
  end

  protected

  def set_user
    @user = current_user
  end
end
