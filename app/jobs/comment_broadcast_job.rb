class CommentBroadcastJob < ApplicationJob
  queue_as :default
  
  def perform(comment)
    ActionCable.server.broadcast "blogs_#{comment.blog.id}_channel", commetn: render_comment(comment)
  end
  
  private
  
  def render_comment(comment)
    CommentsController.rencer partial: 'comments/comment', locals: { comment: comment }
  end
end