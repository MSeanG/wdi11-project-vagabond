class UsersController < ApplicationController
    before_action :authenticate_user!

    def new 
    @user = Current_user.new
    end

    def show
    @user = current_user
    end

    # edit
    def edit
    @user = current_user
    end


    # update
    def update
    @user = current_user
    @user.update(user_params)
    end

    #destroy
    def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to user_profile_path
    end

  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :image, :location)
  end
end

