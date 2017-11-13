class Api::V1::CommentsController < Api::V1::ApiController
  def create
    # create new comment, return success message or errors
    body = JSON.parse(request.body.read)
    comment = Comment.new(body)

    if comment.save
      comments = Comment.where(post_id: body["post_id"]).order('created_at DESC').to_json(include: :user)

      render json: {comments: comments, messages: {comment: ["posted!"]}}
    else
      render json: { error: comment.errors }, status: :unprocessable_entity
    end

  end

  def update
    # edit existing comment, returns updated comment
    body = JSON.parse(request.body.read)
    comment = Comment.find(params[:id])

    comment.update(body: body["body"])

    render json: comment
  end

  def destroy
    # deletes existing comment. Model set up to destroy associations
    comment = Comment.find(params[:id])
    comment.destroy
  end
end
