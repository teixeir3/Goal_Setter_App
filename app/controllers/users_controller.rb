class UsersController < ApplicationController
  before_filter :require_admin_privilege, :only => :destroy
  before_filter :authenticate, :except => [:new, :create]

  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      log_in(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.includes(:goals).find(params[:id])
    render :show
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_url
  end

end
