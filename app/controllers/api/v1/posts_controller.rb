module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :update, :destroy]
      before_action :authenticate_user!
      before_action :authorize_post, only: [:update, :destroy]

      def index
        @posts = Post.includes(:comments).all
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

      def update
        if @post.update(post_params)
          render json: @post, status: :ok
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @post.destroy
        head :no_content
      end

      private

      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:title, :content, :image)
      end

      def authorize_post
        authorize @post
      end
    end
  end
end
