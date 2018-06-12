class V1::PostsController < ApplicationController
  before_action :authenticate_user, only: [:create, :update, :destroy]
  before_action :set_post, only: [:show, :destroy, :update]

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    render json: @post
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: 200
    else
      render json: @post.errors, status: 422
    end
  end

  def update
    @post.update(post_params)
    if @post.save
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
