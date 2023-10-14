class PostsController < ApplicationController
  before_action :set_current_user, only: %i[new create]
  def index
    @user = User.find(params[:user_id])
    @user_posts = @user.posts.includes(comments: :user)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @post_comments = @post.comments.includes(:user)
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.build(post_params)
    if @post.save
      redirect_to post_user_url(@user, @post), notice: 'Post created successfully.'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def like
    @post = Post.find(params[:id])
    current_user.like(@post)
    redirect_back(fallback_location: root_path)
  end

  def unlike
    @post = Post.find(params[:id])
    current_user.unlike(@post)
    redirect_back(fallback_location: root_path)
  end
end
