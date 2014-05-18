class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have signed up successfully"
      redirect_to users_path
    else
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_digest, :password_confirm, :bio)
  end
end
