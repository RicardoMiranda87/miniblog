class Api::V1::PostsController < ApplicationController
  module Api
    module V1
      class PostsController < ApplicationController
        before_action :set_post, only: [:show, :update, :destroy]
        
        def index
          @posts = Post.includes(:comments)
          render json: @posts.as_json(include: :comments)
        end
        
        def show
          render json: @post.as_json(include: :comments)
        end
        
        def create
          @post = current_user.posts.build(post_params)
          if @post.save
            render json: @post, status: :created
          else
            render json: @post.errors, status: :unprocessable_entity
          end
        end
        
        private
  
        def set_post
          @post = Post.find(params[:id])
        end
  
        def post_params
          params.require(:post).permit(:title, :body)
        end
      end
    end
  end
end
