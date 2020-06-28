class UsersController < ApplicationController
	before_action :authenticate_user!
  def index
  	@users = User.all
  	@book = Book.new
    @user = current_user
  end
  def edit
  	@user = User.find(params[:id])
  	if current_user.id != @user.id
  	   redirect_to user_path(current_user.id)
  	end
  end
  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	redirect_to user_path(@user), notice: 'User was successfully updated'
  else
    render "edit"
    end
  end
  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	@books = Book.all
  end
  private

  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
