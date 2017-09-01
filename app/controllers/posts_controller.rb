    class PostsController < ApplicationController
        before_action :authenticate_user!
        load_and_authorize_resource  only: [:edit, :update, :destroy]
      
        # GET /posts
        # GET /posts.json
        def index
          @posts = Post.all
        end

        # GET /posts/new
        def new
          @city = City.find params[:city_id]
          @post = Post.new

          @user = current_user
          @post = Post.new
        end
        
        # create
        def create
          @city = City.find params[:city_id]
          @user = current_user
          @post = @city.posts.create(post_params)
          @post.user_id = current_user.id
          @post.save

          redirect_to city_path(@city)
            
        end

        def show
          @user = current_user
          @post = Post.find(params[:id])
        end
      
        # GET /posts/1/edit
        def edit
          @city = City.find params[:city_id]
          @post = @city.posts.find(params[:id])
        end
      
          # update 
          def update
            @city = City.find params[:city_id]
            @post = @city.posts.find(params[:id])
            @post.update(post_params)
        
            redirect_to city_post_path(@post)
          end
        
          # destroy
          def destroy
            @city = City.find params[:city_id]
            @post = Post.find(params[:id])
            @post.destroy
        
            redirect_to city_path(@city)
          end

  def user
    User.find(params[:user_id])
  end        
  private
    def post_params
      @user = current_user
      params.require(:post).permit(:title, :text, :user_id)
    end
end

