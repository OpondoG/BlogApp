class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id


  validates :name, presence: true, length: { maximum: 250 }
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true },
                            allow_nil: true

  def latest_posts
    Post.order(created_at: :desc).includes(:author).limit(3)
  end

  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
