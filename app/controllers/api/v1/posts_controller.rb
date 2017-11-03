class Api::V1::PostsController < Api::V1::ApiController
  def show
    post = Post.find(params["id"])

    post_user = post.user

    comments = post.comments

    render json: { post: post, comments: comments, post_user: post_user}
  end
end
