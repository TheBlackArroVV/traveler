module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_post, except: :destroy
      before_action :set_comment, only: :destroy

      def index
        render json: @post.comments
      end

      def create
        comment = @post.comments.new(comment_params.merge(user: current_user))

        if comment.save
          render json: comment, status: 201
        else
          render json: comment.errors, status: 422
        end
      end

      def destroy
        @comment.destroy

        render json: {}
      end

      private

      def set_post
        @post = Post.find(params[:post_id])
      end

      def set_comment
        @comment = Comment.find(params[:id])
      end

      def comment_params
        params.require(:comment).permit(:post_id, :body)
      end
    end
  end
end
