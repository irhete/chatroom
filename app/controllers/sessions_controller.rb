class SessionsController < ApplicationController
  def new
  end 

 # "Create" a login, aka "log the user in"
  def create
    user = User.find_by_name(params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash[:error] = 'Invalid name/password combination'
      render 'new'
    end
  end

 # "Delete" a login, aka "log the user out"
  def destroy
    # Remove the user id from the session
    sign_out
    redirect_to root_url, :notice => "You have successfully logged out"
  end

  def sign_in(user)
    session[:current_user_id] = user.id
  end

  def sign_out
    @_current_user = session[:current_user_id] = nil
  end
end
