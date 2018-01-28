class UsersController < ApplicationController
  def new
    redirect_to user_path(current_user) if logged_in?
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to controller: 'users', action: 'new'
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :nausea, :password_confirmation, :happiness, :tickets, :height, :admin)
    end
end
