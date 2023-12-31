class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  after_save :update_likes_counter

  private

  def update_likes_counter
    post.update(likes_counter: user.likes.count)
  end
end
