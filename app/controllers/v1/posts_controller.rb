class V1::PostsController < ApplicationController
  before_action :set_post, only: :show

  def index
    @posts = Post.all
    # respond_with @posts
    render json: @posts
  end

  def show
    # respond_with @post
    render json: @post
  end

  def create
    @post = Post.new(post_params)
    respond_with @post
    # render json: @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
