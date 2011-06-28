class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      #sign_in user
      session[:current_user_id] = user.id
      redirect_to user
    end
  end

  def destroy
    #sign_out
    session[:current_user_id] = nil
    redirect_to root_path
  end

end
