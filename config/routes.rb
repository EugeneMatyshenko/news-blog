Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root to: "users#index"
  # # root to: "users#destroy"
  #
  # resources :users

  resources :users
  root 'users#index'

end
