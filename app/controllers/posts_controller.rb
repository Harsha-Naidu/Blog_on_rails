#  rails g controller posts --no-helper --no-assets

class PostsController < ApplicationController
    before_action :find_post, only:[:show, :edit, :update, :destroy]

    def new
        @post = Post.new
    end

    def create
        @post=Post.new post_params
        if @post.save
            flash[:notice]="Post created successfully."
            redirect_to post_path(@post.id) # show page   
        else
            render :new
        end
    end

    def index
        @posts = Post.all.order(created_at: :desc)
    end

    def show
        
    end

    def edit

    end

    def destroy   
        @post.destroy
        redirect_to posts_path
    end

    def update
        if @post.update post_params
            flash[:notice]="Post edited successfully."
            redirect_to post_path(@post.id)
        else
            render :edit
        end
    end


    private
    def find_post
        @post=Post.find params[:id]
    end

    def post_params
        params.require(:post).permit(:title, :body)
    end

end
