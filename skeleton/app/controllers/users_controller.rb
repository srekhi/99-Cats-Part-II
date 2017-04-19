class UsersController < ApplicationController
  before_action :logged_in?, only: :new

  def new
    render :new
  end

  def create #sign up
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      login!(@user)
      redirect_to cats_url
    else
      flash[:error] = @users.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
