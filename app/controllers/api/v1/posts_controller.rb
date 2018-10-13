module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: %i[show destroy update]

      def index
        posts = Post.all
        render json: posts
      end

      def show
        render json: @post
      end

      def create
        post = Post.new(post_params.merge(user: current_user))
        if post.save
          render json: post, status: 200
        else
          render json: post.errors, status: 422
        end
      end

      def update
        if @post.update(post_params)
          render json: @post, status: 200
        else
          render json: @post.errors, status: 422
        end
      end

      def destroy
        render json: @post.destroy, status: 200
      end

      private

      def post_params
        params.require(:post).permit(:title, :body)
      end

      def set_post
        @post = Post.find(params[:id])
      end
    end
  end
end
