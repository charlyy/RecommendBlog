class UsersController < ApplicationController
  
  def new
    @user = User.new
  end


  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:first_name, :last_nane, :username, :email, :password, :bio, :profile_picture))
      flash[:notice] = 'User profile was successfully updated.'
      redirect_to root_path
    else
      render 'edit'
    end
  end



  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have signed up successfully"
      redirect_to user_path(@user)
    else
      flash[:destroy] = "There was an error in your request"
      render 'new'
    end
  end

  protected

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_digest, :password_confirm, :bio)
  end
end
