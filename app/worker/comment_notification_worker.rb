class CommentNotificationWorker
  include Sidekiq::Worker

  def perform(post_id)
    post = Post.find(post_id)
    # Lógica para enviar e-mail ao autor da postagem
    PostMailer.new_comment_notification(post).deliver_now
  end
end
