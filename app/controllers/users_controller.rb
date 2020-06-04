class UsersController < ApplicationController

  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @nickname = current_user.nickname
    @id = current_user.id
    @posts = current_user.posts.order("created_at DESC")
    @favorites = Favorite.where(user_id: @id).all
  end
end
