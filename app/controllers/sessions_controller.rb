class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def login
  end

  def destroy
      session.delete(:user_id)
      puts session[:user_id]  # Nothing gets printed to the console here
      render json: {isLogin: false}
      redirect_to '/login'
   end 

  def create
     @user = User.find_by(username: params[:username])
     if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to '/welcome'
     else
        redirect_to '/login'
     end
  end

  def page_requires_login
  end

end