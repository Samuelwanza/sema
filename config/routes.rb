# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: :user_posts
  get 'users/:user_id/posts', to: 'posts#index',as: :posts_user
  get '/users/:user_id/posts/new', to: 'posts#new', as: :new_user_post
  get 'users/:user_id/posts/:post_id', to: 'posts#show',as: :post_user
  get '/users/:user_id/posts/:post_id/comments/new', to: 'comments#new', as: :new_user_post_comment
  post '/users/:user_id/posts', to: 'posts#create', as: :create_user_post
  post '/users/:user_id/posts/:post_id/comments', to: 'comments#create', as: :create_user_post_comment
  post 'posts/:id/like', to: 'posts#like', as: :like_post
  delete 'posts/:id/unlike', to: 'posts#unlike', as: :unlike_post
end
