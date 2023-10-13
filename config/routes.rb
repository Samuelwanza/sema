# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: :user_posts
  get 'users/:user_id/posts', to: 'posts#index',as: :posts_user
  get 'users/:user_id/posts/:post_id', to: 'posts#show',as: :post_user
end
