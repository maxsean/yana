class Api::V1::PostsController < Api::V1::ApiController
  def show
    post = Post.find(params["id"])

    post_user = post.user

    comments = post.comments.order('created_at DESC')

    render json: { post: post, comments: comments, post_user: post_user}
  end

  def create
    body = JSON.parse(request.body.read)
    post = Post.new(body)

    if post.save
      posts = Post.where(forum_id: body["forum_id"]).order('created_at DESC')

      render json: {posts: posts, messages: {post: ["successful!"]}}
    else
      render json: { error: post.errors }, status: :unprocessable_entity
    end
  end
end
