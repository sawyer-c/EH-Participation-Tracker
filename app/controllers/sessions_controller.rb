class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def login
  end

  def destroy
      session.delete(:user_id)
      puts session[:user_id]  # Nothing gets printed to the console here
      redirect_to '/welcome'
   end 

  def create
     @user = User.find_by(email: params[:email])
     if @user && @user.authenticate(params[:password])
      if user.activated?
         log_in user
        session[:user_id] = @user.id
        redirect_to '/welcome'
      else
         message = "Account not activated"
         message += "Check your email for the activation link"
      end
     else
         flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
        redirect_to '/login'
     end
  end

  def page_requires_login
  end

end