Rails.application.routes.draw do
  devise_for :users
  # devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root to: "users#index"
  # # root to: "users#destroy"
  #
  # resources :users

  # resources :users
  # root 'users#index'

  # resources :articles
  # resources :comments

  resources :articles do
    resources :comments, module: :articles
  end

  resources :comments do
    resources :comments, module: :comments
  end

end

