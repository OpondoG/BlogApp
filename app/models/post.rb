class Post < ApplicationRecord
  has_many :likes, foreign_key: 'posts_id'
  has_many :comments, foreign_key: 'posts_id'
  belongs_to :author, class_name: 'User', dependent: :destroy, foreign_key: 'author_id'
  after_save :post_counter

  def latest_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def post_counter
    author.increment!(:posts_counter)
  end
end
