class Api::V1::ForumsController < Api::V1::ApiController
  def show
    forum = Forum.find(params["id"])

    posts = forum.posts.order('created_at DESC')

    render json: { forum: forum, posts: posts}
  end
end
