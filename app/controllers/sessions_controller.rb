class SessionsController < ApplicationController
  def new
  end

  def create
    # look up the email,  :session is for the form in sessions view
    @user = User.where(:email => params[:session][:email]).first
    # where will return an empty array if nothing matches or one, or multiple
    # correct sign in
    # if @user = if user is not nil, user is in database
    # if password is true, right password
    if @user && @user.authenticate(params[:session][:password]) 
      sign_in @user
      redirect_to root_path
    else
      flash[:error] = "Invalid email/password combination"
      render 'new'
    end

  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
