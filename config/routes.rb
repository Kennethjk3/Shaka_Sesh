Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users

  devise_scope :user do
  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  unauthenticated do
    root 'visitors#index', as: :unauthenticated_root
  end
end
  resources :users
  resources :dashes
end
