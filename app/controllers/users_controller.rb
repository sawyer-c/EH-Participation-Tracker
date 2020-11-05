class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]


  def new
    @user = User.new
  end

  def create
    # Create the user from params

    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end