class PostController < ApplicationController

    def index
    end

    def new
    end

    def create 
        @post = Post.new(post_params)
    end

    private def post_params 
        params.require(:post).inspect
    end
end
