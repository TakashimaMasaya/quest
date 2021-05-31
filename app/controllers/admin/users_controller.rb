class Admin::UsersController < ApplicationController
  layout 'admin/layouts/application'
  before_action :require_admin
  skip_before_action :login_required, only: [:new, :create]
  skip_before_action :require_admin, only: [:new, :create]
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

    if @user.update(user_params)
      redirect_to admin_users_path(@user), notice:"ユーザー「#{@user.name}」を更新しました。"
    else
      render :new
      #redirect_to　edit_admin_user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:id])
    #他のモデルに紐づいているから削除できない
    @user.destroy!
    redirect_to admin_users_path, notice:"ユーザー「#{@user.name}」を削除しました。"
  end

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice:"ユーザー「#{@user.name}」を登録しました。"
    else
      render :new
    end
  end

  private

  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end

  def require_admin
    redirect_to root_path unless current_user.admin?
  end
end
