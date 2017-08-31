class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
    @user = current_user
    end
    def new 
    @user = Current_user.new
    end
    # edit
  def edit
    @user = User.find(params[:id])
    @user = current_user
  end


  # update
  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to user_profile_path(@user)
  end

  # destroy
#   def destroy
#     @user = User.find(params[:id])
#     @user.destroy

#     redirect_to user_profile_path
#   end
  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :image, :location)
  end
end

