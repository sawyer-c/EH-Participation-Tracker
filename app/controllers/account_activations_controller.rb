class AccountActivationsController < ApplicationController

    def edit
      user = User.find_by(email: params[:email])
      # params[:id] is the first parameter of the activation url -> token
      if user && !user.activated? && user.authorized?(:activation, params[:id])
        user.activate
        log_in user
        flash[:success] = "Account activated!"
        redirect_to user
      else
        flash[:danger] = "Invalid activation link"
        redirect_to root_url
      end
    end

  end