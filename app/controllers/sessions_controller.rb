class SessionsController < ApplicationController
  def create
    @user
  end

  private

  def set_user
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      require_user
      flash[:success] = "Welcome #{user.name}"
      redirect_to session.delete(:return_to) || dashboard_path
    else
      flash[:alert] = 'User name and/or password is incorrect'
      redirect_to login_path
    end
  end
end
