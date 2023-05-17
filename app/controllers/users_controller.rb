class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_profile_path(@user)
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit!(:email, :password, :password_confirmation)
  end

end
