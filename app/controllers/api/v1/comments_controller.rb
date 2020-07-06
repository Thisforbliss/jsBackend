class Api::V1::CommentsController < ApplicationController
    
        
    def create
      @comment= Comment.create(comment_params)
      serialized_data = CommentSerializer.new(@comment).serialized_json
      render json: serialized_data, status: 200
    end

    def new
        comment = Comment.new
        render json: comment

    end

    def index
        @comments = Comment.all
        render json: @comments
    end

    def show
        @comment = Comment.find(params[:id])
        render json: @comment
    end
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy

        render json: {commentId: @comment.id}
    end

    def comment_params
        params.require(:comments).permit(:content)
    end
end
