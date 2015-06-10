class PostsController < ApplicationController

  # /posts
  def index
    @posts = Post.all
  end

  # /posts/new
  def new
    @post = Post.new
  end

  # /posts/3
  # /posts/:id
  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to @post
    else
      render action: "new"
    end
  end

  # /posts/:id/edit
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(posts_params)
      redirect_to @post
    else
      render action: "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:message] = "deleted!"
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

  private

  def posts_params
    params.require(:post).permit(:post, :view_count, :blog)
  end
end
