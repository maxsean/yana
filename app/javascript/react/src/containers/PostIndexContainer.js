import React from 'react'
import PostTile from '../components/PostTile'

class PostIndexContainer extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      posts: {}
    }
  }

  componentWillReceiveProps(nextProps) {
    this.setState({ posts: nextProps.posts });
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
          created_at={post.created_at}
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
