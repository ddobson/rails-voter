class Post < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_many :comments
  acts_as_commentable
  acts_as_votable

  def latest
    Post.all.order(created_at: :desc).limit(20)
  end

  def total_post_votes(id)
    @post = Post.find(id)
    @post.get_upvotes.size - @post.get_downvotes.size
  end
end
