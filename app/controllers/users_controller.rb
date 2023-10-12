class UsersController < ApplicationController
  def index
    @user_data = User.select('name, COUNT(posts.id) AS post_count')
      .joins(:posts)
      .group('users.id')
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end
end
