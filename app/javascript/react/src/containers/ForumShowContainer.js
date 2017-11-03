import React from 'react';
import BackButton from '../components/BackButton';
import PostIndexContainer from './PostIndexContainer';

class ForumShowContainer extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      forum: {},
      posts: []
    }
  }

  componentDidMount() {
    let forumId = this.props.params.id
    fetch(`/api/v1/forums/${forumId}`)
    .then(response => response.json())
    .then(data => {
      this.setState({
        forum: data.forum,
        posts: data.posts
      })
    })
  }

  render(){
    let postIndex;
    if(this.state.posts.length > 0){
      postIndex =
      <PostIndexContainer
        posts={this.state.posts}
      />
    }
    return(
      <div>
        <div id="intro">
          <h1>
            {this.state.forum.name}
          </h1>
          <hr/>
          <h3>
            {this.state.forum.description}
          </h3>
        </div>
        <hr/>
          {postIndex}
      </div>
    )
  }
}

export default ForumShowContainer;
