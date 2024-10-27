Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :posts do
        resources :comments, only: [:create, :index, :destroy]
      end
    end
  end
end
