class UsersController < ApplicationController

  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC")
    @favorites = Favorite.where(user_id: @user.id).all
    
  end
end
