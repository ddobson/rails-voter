class Post < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  
  def latest
    Post.all.order(created_at: :desc).limit(20)
  end
end
