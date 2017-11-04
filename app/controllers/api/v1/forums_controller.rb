class Api::V1::ForumsController < Api::V1::ApiController
  def show
    forum = Forum.find(params["id"])

    posts = forum.posts.order('created_at DESC').to_json(include: :user)

    render json: { forum: forum, posts: posts}
  end
end
