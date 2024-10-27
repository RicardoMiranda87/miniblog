Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: 'posts#index', as: :authenticated_root
  end

  devise_scope :user do
    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :posts do
        resources :comments, only: [:create, :index, :destroy]
      end
    end
  end
end
