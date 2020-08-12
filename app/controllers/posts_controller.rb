class PostsController < ApplicationController
 # before_action :move_to_index, except: [:index, :show]
 # before_action :authenticate_user!, only: [:create]

  def index
    @posts = Post.includes(:images, :user).order("created_at DESC").page(params[:page]).per(20)
    @post = Post.new
    @likedPosts = Post.includes(:images, :user).joins(:likes).group(:post_id).order('count(likes.user_id) desc')
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
    @like = Like.new
    @data = {'2019-06-01': 100, '2019-06-02': 200, '2019-06-03': 150}
    @dd = Post.group(:user_id).count(:user_id).sort.reverse
    @ss = {}
    @dd.each do |key, value|
      name = User.find(key).nickname
      atai = value.to_i
      @ss[name] = atai
    end
    @categories = Category.all

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

  def search
    @posts = Post.search(params[:keyword])
  end

  def about
    
  end

#  def search_Ransack
#    @search = Post.ransack(params[:q])
#    # 検索結果
#    @results = @search.result.includes(:images, :user).page(params[:page])
#  end

  private
  def post_params
    params.require(:post).permit(:name, :text, images_attributes: [:image], category_ids: []).merge(user_id: current_user.id)
  end

  def update_post_params
    params.require(:post).permit(:name, :text, images_attributes: [:image, :_destroy, :id], category_ids: [])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
