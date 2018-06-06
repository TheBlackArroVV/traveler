class V1::PostsController < ApplicationController
  before_action :set_post, only: :show

  def index
    @posts = Post.all
    respond_with @posts
  end

  def show
    respond_with @post
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
