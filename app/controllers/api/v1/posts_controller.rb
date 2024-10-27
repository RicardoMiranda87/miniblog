class Api::V1::PostsController < ApplicationController
  module Api
    module V1
      class PostsController < ApplicationController
        before_action :set_post, only: [:show, :edit, :update, :destroy]
        
        def index
          @posts = Post.all
          render json: @posts.as_json(include: :comments)
        end
        
        def show
          @post = Post.find(params[:id])
          render json: @post.as_json(include: :comments)
        end
        
        def create
          @post = current_user.posts.build(post_params)
          authorize @post

          if @post.save
            render json: @post, status: :created
          else
            render json: @post.errors, status: :unprocessable_entity
          end
        end

        def edit
          authorize @post
        end
        
        def update
          authorize @post
          if @post.update(post_params)
            redirect_to @post, notice: "Postagem atualizada com sucesso."
          else
            render :edit
          end
        end

        def destroy
          authorize @post
          @post.destroy
          redirect_to posts_url, notice: "Postagem excluída com sucesso."
        end
        private
  
        def set_post
          @post = Post.find(params[:id])
        end
  
        def post_params
          params.require(:post).permit(:title, :content, :image)
        end
      end
    end
  end
end
