class CommentNotificationJob < ApplicationJob
  queue_as :default

  def perform(comment)
    UserMailer.comment_notification(comment).deliver_later
  end
end
