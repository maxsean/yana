import React from 'react'
import PostTile from '../components/PostTile'

class PostIndexContainer extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      reviews: {}
    }
  }

  componentWillReceiveProps(nextProps) {
    this.setState({ reviews: nextProps.reviews });
  }

  render(){
    let posts = this.props.posts.map(post => {
      return(
        <PostTile
          key={String(Date.now()) + '-' + post.id}
          id={post.id}
          title={post.title}
          body={post.body}
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
