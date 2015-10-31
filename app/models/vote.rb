class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def upvote(user, post)
    @vote = Vote.new
    @vote.vote_value = 1
    @vote.user = user
    @vote.post = post
    @vote.save
  end
end
