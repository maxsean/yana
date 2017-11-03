import React from 'react';
import BackButton from '../components/BackButton';
import CommentIndexContainer from './CommentIndexContainer';

class PostShowContainer extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      post: {},
      comments: [],
      post_user: {}
    }
  }

  componentDidMount() {
    let postId = this.props.params.id
    fetch(`/api/v1/posts/${postId}`)
    .then(response => response.json())
    .then(data => {
      this.setState({
        post: data.post,
        comments: data.comments,
        post_user: data.post_user
      })
    })
  }

  render(){
    let commentIndex;
    if(this.state.comments.length > 0){
      commentIndex =
      <CommentIndexContainer
        comments={this.state.comments}
      />
    }
    return(
      <div>
        <div id="intro">
          <h1>
            {this.state.post.title}
          </h1>
          <hr/>
          <h3>
            {this.state.post.body}
          </h3>
          <p>
            made by {this.state.post_user.handle} on {Date(this.props.created_at).toString().substring(3,15)}
          </p>
          <h3 style={{paddingLeft:"5%"}}>
            Comments
          </h3>
        </div>
        <hr/>
          {commentIndex}
      </div>
    )
  }
}

export default PostShowContainer;
