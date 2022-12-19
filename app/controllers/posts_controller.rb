class PostsController < ApplicationController

  before_action :get_post, only: [:update, :destroy]

  def index
    @posts = Post.search(keyword_params)
  end

  def create
    @post = Post.create(post_params)
    if @post.valid?
      render "posts/create", format: :json, status: :created
    else
      render json: { message: "Save error" }, status: :unprocssable_entity
    end
  end

  def update
    if @post
      @post.update post_params
      render "posts/update", format: :json, status: :ok
    else
      render json: { message: "update error" }, status: :unprocssable_entity
    end
  end

  def destroy
    @post.destroy
    render json: { message: "Post #{@post.title} was delete" }, status: :ok
  end

  private

  def get_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description)
  end

  def keyword_params
    params[:keyword]
  end

end
