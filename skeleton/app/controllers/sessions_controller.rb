class SessionsController < ApplicationController
  before_action :logged_in?, only: :new
  def new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login!(@user)
      redirect_to cats_url
    else
      flash[:error] = "Invalid credentials"
      redirect_to new_session_url
    end
  end

  def destroy
    @user = current_user
    if @user
      @user.reset_session_token!
      session[:session_token] = nil
    end
    redirect_to new_session_url
  end

end
