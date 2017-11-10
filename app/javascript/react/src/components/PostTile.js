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

    let buttons;
    if(this.props.current_user.id == this.props.user.id){
      buttons =
      <div style={{float: "left"}}>
        <button style={{backgroundColor: "#00B200", marginRight: "10px"}}>
          Edit
        </button>
        <button style={{backgroundColor: "#333333"}} onClick={this.props.handleDelete}>
          Delete
        </button>
      </div>
    }

    return(
      <div className="grid-x" id="tile">
        <div className="small-4" id={this.props.post_type}>
        </div>
        <div className="small-8" id="tileInfo">
          <div id="link">
            <Link to={`/posts/${id}`}> {this.props.title} </Link>
          </div>
          <div>
            Made by {this.props.user.handle} on {Date(created_at).toString().substring(3,15)}
            <span>
              <p>Karma: {this.state.karma} | Comments: {this.props.comments.length}</p>
            </span>
            {buttons}
          </div>
        </div>
        <hr/>
      </div>
    )
  }
}

export default PostTile;
