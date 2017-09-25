class UsersController < ApplicationController
    before_action :authenticate_user!
    after_action :allow_iframe, only: [:basic_embed, :awesome_embed]
    

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

    redirect_to user_profile_path(@user)
    end

  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :image, :location)
  end
end

