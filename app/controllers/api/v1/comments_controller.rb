class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  # POST /posts/:post_id/comments
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge(user: current_user))
    authorize @comment

    if @comment.save
      redirect_to @post, notice: "Comentário adicionado com sucesso."
    else
      redirect_to @post, alert: "Não foi possível adicionar o comentário."
    end
  end

  # GET /posts/:post_id/comments/:id/edit
  def edit
    authorize @comment
  end

  # PATCH/PUT /posts/:post_id/comments/:id
  def update
    authorize @comment
    if @comment.update(comment_params)
      redirect_to @comment.post, notice: "Comentário atualizado com sucesso."
    else
      render :edit
    end
  end

  # DELETE /posts/:post_id/comments/:id
  def destroy
    authorize @comment
    @comment.destroy
    redirect_to @comment.post, notice: "Comentário excluído com sucesso."
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
