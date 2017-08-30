    class PostsController < ApplicationController
        # before_action :authenticate_user!
        # # before_action :set_post, only: [:show, :edit, :update, :destroy]
        # load_and_authorize_resource  only: [:edit, :update, :destroy]
      
        # GET /posts
        # GET /posts.json
        def index
          @posts = Post.all
        end
      
        # GET /posts/1
        # GET /posts/1.json
        def show
          @user = current_user
          @post = Post.find(params[:id])
        end
      
        # GET /posts/new
        def new
          @user = current_user
          @post = Post.new
        end
      
        # GET /posts/1/edit
        def edit
        end
      
          # create
          def create
            @post = Post.create(post_params)
        
            
            redirect_to posts_path(@post)
          end
        
          # update 
          def update
            @post = Post.find(params[:id])
            @post.update(post_params)
        
            redirect_to post_path(@post)
          end
        
          # destroy
          def destroy
            @post = Post.find(params[:id])
            @post.destroy
        
            redirect_to posts_path
          end
        
      private
  def post_params
    params.require(:post).permit(:title, :text, :city_id)
  end
end
      

