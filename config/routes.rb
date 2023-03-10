Rails.application.routes.draw do
  devise_for :users
  root "users#index"

  get 'posts/new', to: 'posts#new'
  get 'comments/new', to: 'comments#new'

  post 'posts/', to: 'posts#create'
  post 'comments/', to: 'comments#create'

  post '/users/:user_id/posts/:id/likes', to: 'likes#create'

  resources :users ,only:[:index,:show]do
  resources :posts, only: [:index, :create, :new, :show]
end

resources :posts do
  resources :comments, only: [:create, :new]
  resources :likes, only: [:create]
  end
end

                                                                                                                                                                                              
