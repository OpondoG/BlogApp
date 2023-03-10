class Post < ApplicationRecord
  has_many :likes, foreign_key: 'posts_id'
  has_many :comments, foreign_key: 'post_id'
  belongs_to :author, class_name: 'User', dependent: :destroy, foreign_key: 'author_id'

  after_save :post_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 },
                               allow_nil: true
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 },
                            allow_nil: true

  def latest_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :update_posts_counter

  private

  def post_counter
    author.increment!(:posts_counter)
  end
end
