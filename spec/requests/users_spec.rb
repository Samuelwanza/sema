require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns a successful response' do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get users_path
      expect(response).to render_template(:index)
    end
    it 'includes correct placeholder text in the response body' do
      get users_path
      expect(response.body).to include('Username')
    end
  end

  describe 'GET /users/:id' do
    it 'returns a successful response' do
      get user_posts_path(User.first)
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get user_posts_path(User.first)
      expect(response).to render_template(:show)
    end
    it 'includes correct placeholder text in the response body' do
      get user_posts_path(User.first)
      expect(response.body).to include('Number of Posts')
    end
  end
end
