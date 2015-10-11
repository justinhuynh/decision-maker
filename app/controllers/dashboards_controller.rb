class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  protected

  def set_user
    @user = current_user
  end
end
