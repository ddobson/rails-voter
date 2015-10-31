class VotesController < ApplicationController
  def upvote
    @vote = Vote.new
    @vote.vote_value = 1
    @vote.post_id = (params[:id])
    @vote.user = current_user
    @vote.save
    redirect_to '/'
  end

  def downvote
    @vote = Vote.new
    @vote.vote_value = -1
    @vote.post_id = (params[:id])
    @vote.user = current_user
    @vote.save
    redirect_to '/'
  end
end