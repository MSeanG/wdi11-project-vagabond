
class UsersController < ApplicationController
    def show
    end
    def edit
        @user = User.find(params[:id])
      end
    # update
      def update
        @user = User.find(params[:id])
        @user.update(user_params)
    
        redirect_to users_path(@user)
      end
end
