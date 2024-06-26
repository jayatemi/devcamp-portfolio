class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment)
    ActionCable.server.broadcast "blogs_#{comment.blog_id}_channel", comment: render_comment(comment)
  end

  private

  def render_comment(comment)
    ApplicationController.render partial: 'comments/comment', locals: { comment: comment }
  end
end
