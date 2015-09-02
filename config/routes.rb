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
  resources :meets
  resources :invites, only: [:create, :destroy]

  get "/messages" => redirect("/conversations")
    resources :messages do
    member do
      post :new
    end
  end
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
   collection do
      get :trashbin
      post :empty_trash
   end
  end



end
