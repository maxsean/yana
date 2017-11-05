import React from 'react';
import { Link } from 'react-router';
import CommentIndexContainer from '../containers/CommentIndexContainer';

class PostTile extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      karma: 0,
      upvote: 0,
      downvote: 0
    }
  }

  componentDidMount() {
    this.fetchPostVote()
  }

  fetchPostVote(user, post) {
    let check_state = {
      user_id: null,
      post_id: this.props.id
    }
    fetch('/api/v1/post_votes', {
      method: "POST",
      body: JSON.stringify(check_state)
    })
    .then(response => response.json())
    .then(data => {
      this.setState({
        karma: data["karma"],
        upvote: data["upvote"],
        downvote: data["downvote"]
      })
    })
  }


  render(){
    let id = this.props.id
    let created_at = this.props.created_at
    return(
      <div className="grid-x" id="tile">
        <div className="small-12" id="link">
          <Link to={`/posts/${id}`}> {this.props.title} </Link>
        </div>
        <div className="small-12">
          {this.props.body}
        </div>
        <div className="small-12">
          Made by {this.props.user.handle} on {Date(created_at).toString().substring(3,15)}
        </div>
        <div>
          Score: {this.state.karma}
        </div>
        <hr/>
      </div>
    )
  }
}

export default PostTile;
