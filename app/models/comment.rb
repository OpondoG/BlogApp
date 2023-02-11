class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  after_save :comment_counter

  after_save :update_comments_counter

  private

  def comment_counter
    post.increment!(:comments_counter)
  end
end
