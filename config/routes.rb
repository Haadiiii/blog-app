# frozen_string_literal: true

Rails.application.routes.draw do
  get 'posts/index'
  get 'users/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root 'users#index'
  # Defines the route for the users index page ("/users")
  resources :users do
    # Defines the route for the posts index page ("/users/:user_id/posts")
   resources :posts
  end
end