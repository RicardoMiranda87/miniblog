class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]
  before_action :set_post
  before_action :authenticate_user!

  def create
    @comment = @post.comments.build(comment_params.merge(user: current_user))
    authorize @comment
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @comment
    if @comment.update(comment_params)
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @comment
    @comment.destroy
    head :no_content
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
