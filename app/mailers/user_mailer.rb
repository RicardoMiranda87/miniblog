class UserMailer < ApplicationMailer
  def comment_notification(comment)
    @comment = comment
    mail(to: comment.post.user.email, subject: "New comment on your post")
  end
end
