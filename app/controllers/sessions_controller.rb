class SessionsController < ApplicationController
  before_action :require_user, only: [:index]
  
  def index
  end

  def new
  end
  
  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to logged_path, notice: '登入成功'
    else
      redirect_to login_path, notice: '登入失敗'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
