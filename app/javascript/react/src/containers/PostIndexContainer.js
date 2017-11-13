import React from 'react'
import PostTile from '../components/PostTile'

class PostIndexContainer extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      posts: this.props.posts
    }
  }

  componentWillReceiveProps(nextProps) {
    this.setState({ posts: nextProps.posts });
  }

  handleDelete(id) {
    this.props.deletePost(id)
  }

  render(){
    let posts = this.props.posts.map(post => {
      return(
        <PostTile
          key={String(Date.now()) + '-' + post.id}
          id={post.id}
          title={post.title}
          body={post.body}
          user={post.user}
          comments={post.comments}
          post_type={post.post_type}
          created_at={post.created_at}
          current_user={this.props.current_user}
          handleDelete={() => this.handleDelete(post.id)}
          fetchForum={this.props.fetchForum}
          forum_id={this.props.forum_id}
          post={post}
        />
      )
    })
    return(
      <div>
        {posts}
      </div>
    )
  }
}

export default PostIndexContainer;
