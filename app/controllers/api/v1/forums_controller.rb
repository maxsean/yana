class Api::V1::ForumsController < Api::V1::ApiController
  def show
    forum = Forum.find(params["id"])

    posts = forum.posts

    render json: { forum: forum, posts: posts}
  end
end
