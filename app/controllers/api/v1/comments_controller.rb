class Api::V1::CommentsController < Api::V1::ApiController
  def create
    body = JSON.parse(request.body.read)
    comment = Comment.new(body)

    if comment.save
      comments = Comment.where(post_id: body["post_id"]).order('created_at DESC').to_json(include: :user)

      render json: {comments: comments, messages: {comment: ["posted!"]}}
    else
      render json: { error: comment.errors }, status: :unprocessable_entity
    end

  end
end
