class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/', notice: '註冊成功'
    else
      redirect_to '/signup', noitce: '註冊失敗'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
