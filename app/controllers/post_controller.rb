class PostController < ApplicationController

    def index
        @post = Post.all
    end

    def new
        @post = Post.new
    end

    def create 
        @post = Post.new(post_params)
        if @post.save
            redirect_to root_path
        else 
            render :plain => @post.errors.inspect
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to root_path, :notice => "Post deleted"
    end

    private def post_params 
        params.require(:post).permit(:title, :body)
    end
end
