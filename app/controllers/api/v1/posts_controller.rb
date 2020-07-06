class Api::V1::PostsController < ApplicationController
    
    def index
        @posts = Post.all
        serialized_data = PostSerializer.new(@posts).serialized_json
        render json: serialized_data, status: 200
    end


    def new
        @post = Post.new

        render json: @post
    end

    def show
        @post = Post.find(params[:id])

        render json: @post, status: 200
    end

    def create
        @post = Post.new(post_params)
        if  @post.save
            serialized_data = PostSerializer.new(@post).serialized_json
        render json: serialized_data, status: 200
        else
        render 'new'
        end
    end

    def show
        @post = Post.find(params[:id])
        render json: @post
    end

    def edit
        @post = Post.find(params[:id])
        render json: @post, status:200
    end

    def update
        if @post.update(post_params)
            render json: @post, status: 200
        else
            render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        
        render json: {postId: @post.id}
    end

    private

    def post_params
        params.require(:post).permit(:title, :content)
    end

end
