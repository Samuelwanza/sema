require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    it 'returns a successful response' do
      get posts_user_path(User.first)
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get posts_user_path(User.first)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/:user_id/posts/:post_id' do
    it 'returns a successful response' do
      get post_user_path(User.first, Post.first)
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get post_user_path(User.first, Post.first)
      expect(response).to render_template(:show)
    end
  end
end
