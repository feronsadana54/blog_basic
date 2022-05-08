class PostController < ApplicationController

    def index
        @post = Post.all
    end

    def new
    end

    def create 
        @post = Post.new(post_params)
        if @post.save
            redirect_to root_path
        else 
            render :plain => @post.errors.inspect
        end
    end

    private def post_params 
        params.require(:post).permit(:title, :body)
    end
end
