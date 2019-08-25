class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:home]
  def home
  end

  def show
  	@user = User.find(params[:id])

  end

  def edit
  	@user = User.find(params[:id])
  	if @user.id != current_user.id
  		redirect_to user_path(current_user.id)

  	end

  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    	flash[:notice] = "successfully!!"
    redirect_to user_path(@user.id)
    else
    	flash[:notice] = "error, please agein."
    	render :edit
    end
  end

  def index
  	@users = User.all
  	@user = current_user
  end

  def destroy
  	user = User.find(params[:id])
  	if user.destroy
  		flash[:notice] = "successfully!!"
  	end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
