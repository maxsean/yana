class Api::V1::ForumsController < Api::V1::ApiController
  def show
    # returns a specific forum and associated posts (starting with latest to oldest) and its associated user and comments
    forum = Forum.find(params["id"])

    posts = forum.posts.order('created_at DESC').to_json(include: {user: {}, comments: {}})

    render json: { forum: forum, posts: posts}
  end
end
