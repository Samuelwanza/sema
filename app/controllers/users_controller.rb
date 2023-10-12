class UsersController < ApplicationController
  def user_data
    @user_data = User.select('name, COUNT(posts.id) AS post_count')
      .joins(:posts)
      .group('users.id')
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end

  def show_posts
    @user = User.find(params[:user_id])
    @user_posts = @user.posts.includes(comments: :user)
  end

  def show_post
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @post_comments = @post.comments.includes(:user)
  end
end
