class SessionsController < ApplicationController
  before_action :set_user, only: :create

  def create
    @user
  end

  private

  def set_user
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      require_user
      redirect_to dashboard_path(@user)
    else
      flash[:alert] = 'User name and/or password is incorrect'
      redirect_to login_path
    end
  end
end
