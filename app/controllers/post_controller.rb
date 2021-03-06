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

    def show 
        @post = Post.find(params[:id])
        
        if @post.image == nil
            @post.image = "https://www.w3schools.com/w3css/img_avatar3.png"
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
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
        params.require(:post).permit(:title, :body, :image)
    end
end
