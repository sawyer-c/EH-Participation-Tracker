class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]


  def new
    @user = User.new
  end

  def create
    # Create the user from params

    @user = User.create(params.require(:user).permit(:username, :password))
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/welcome'
    end
 end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end