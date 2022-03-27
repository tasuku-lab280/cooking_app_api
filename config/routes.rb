Rails.application.routes.draw do
  # Front
  root 'home#index'
  devise_for :users

  # API
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'
  end
end
