class Api::V1::PostVotesController < ApplicationController

  def create
    # creates a new vote between a user and a post and returns user's choice and post karma score. Involves PostVote class method which calculates karma
    body = JSON.parse(request.body.read)

    user_vote = PostVote.find_by(user_id: body["user_id"], post_id: body["post_id"])
    return_value = 0

    if !user_vote.nil?
      return_value = user_vote["value"]
    end

    karma = PostVote.getKarma(post_id: body["post_id"])[:karma]
    upvote = PostVote.getKarma(post_id: body["post_id"])[:upvote]
    downvote = PostVote.getKarma(post_id: body["post_id"])[:downvote]

    render json: { value: return_value, karma: karma, upvote: upvote, downvote: downvote }
  end

  def update
    # updates existing vote between a user and a post and returns user's choice and post karma score. Involves PostVote class method which calculates karma
    body = JSON.parse(request.body.read)
    postVote = PostVote.new(body)

    if postVote.save
      karma = PostVote.getKarma(post_id: body["post_id"])[:karma]
      upvote = PostVote.getKarma(post_id: body["post_id"])[:upvote]
      downvote = PostVote.getKarma(post_id: body["post_id"])[:downvote]

      render json: { karma: karma, upvote: upvote, downvote: downvote }
    else
      user_vote = PostVote.find_by(user_id: body["user_id"], post_id: body["post_id"])
      user_vote.update(value: body["value"])

      karma = PostVote.getKarma(post_id: body["post_id"])[:karma]
      upvote = PostVote.getKarma(post_id: body["post_id"])[:upvote]
      downvote = PostVote.getKarma(post_id: body["post_id"])[:downvote]

      render json: { karma: karma, upvote: upvote, downvote: downvote }
    end
  end

end
