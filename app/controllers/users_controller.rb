class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @id = current_user.id
    @posts = current_user.posts.order("created_at DESC")
    @favorites = Favorite.where(user_id: @id).all

  end
end
