class UsersController < ApplicationController
  def index
    @user_data = User.select('name, photo,COUNT(posts.id) AS post_count')
      .left_joins(:posts)
      .group('users.id', 'users.name', 'users.photo')
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end
end
