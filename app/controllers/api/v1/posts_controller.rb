class Api::V1::PostsController < Api::V1::ApiController
  def show
    post = Post.find(params["id"]).to_json(include: :user)

    comments = Post.find(params["id"]).comments.order('created_at DESC').to_json(include: :user)

    render json: {post: post, comments: comments}
  end

  def create
    body = JSON.parse(request.body.read)
    post = Post.new(body)

    if post.save
      posts = Post.where(forum_id: body["forum_id"]).order('created_at DESC').to_json(include: {user: {}, comments: {}})

      render json: {posts: posts, messages: {post: ["successful!"]}}
    else
      render json: { error: post.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end
end
