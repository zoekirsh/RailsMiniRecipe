class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.create(user_params)
  #   if @user.valid?
  #     redirect_to @user
  #   else
  #     flash[:errors] = @user.errors.full_messages
  #     redirect_to new_user_path 
  #   end
  # end

  # def edit
  # end

  # def update
  #   @user = User.update(user_params)
  #   redirect_to @user
  # end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user 
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
