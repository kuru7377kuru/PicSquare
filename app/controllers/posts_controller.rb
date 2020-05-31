class PostsController < ApplicationController
  def index
    @posts = Post.includes(:images)
    @imm = Image.all

  end

  def new
    @post = Post.new
    @post.images.build
  end
  
  def create 
    @post = Post.create(post_params)
    @post.save
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.includes(:images).find(params[:id])
  end 
  
  def update
    post = Post.find(params[:id])
    post.update(update_post_params)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end
  private
  def post_params
    params.require(:post).permit(:name, :text, images_attributes: [:image])
  end

  def update_post_params
    params.require(:post).permit(:name, :text, images_attributes: [:image, :_destroy, :id])
  end
end
