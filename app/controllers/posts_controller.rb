class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]


  def index
    @posts = Post.includes(:images, :user).order("created_at DESC").page(params[:page]).per(5)
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
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
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
    params.require(:post).permit(:name, :text, images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def update_post_params
    params.require(:post).permit(:name, :text, images_attributes: [:image, :_destroy, :id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
