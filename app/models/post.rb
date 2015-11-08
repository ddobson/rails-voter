class Post < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_many :comments
  acts_as_commentable

  def latest
    Post.all.order(created_at: :desc).limit(20)
  end

end
