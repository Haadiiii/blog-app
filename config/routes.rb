Rails.application.routes.draw do
  get 'posts/index'
  get 'users/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root 'users#index'
  # Defines the route for the users index page ("/users")
  resources :users, only: [:index, :show] do
    # Defines the route for the posts index page ("/users/:user_id/posts")
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:create, :new]
    end
  end
end
