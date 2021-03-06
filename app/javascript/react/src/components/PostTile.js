import React from 'react';
import { Link } from 'react-router';
import CommentIndexContainer from '../containers/CommentIndexContainer';
import PostFormContainer from '../containers/PostFormContainer';

// child of PostIndexContainer
class PostTile extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      karma: 0,
      upvote: 0,
      downvote: 0,
      edit: false,
      post: this.props.post
    };
    this.handleEditClick = this.handleEditClick.bind(this);
    this.editPost = this.editPost.bind(this);
  }

  componentDidMount() {
    this.fetchPostVote();
  };

  // make sure component rerenders when user submits new post, or edits/delete
  componentWillReceiveProps(nextProps) {
    this.setState({ post: nextProps.post });
  };

  // get current post karma and current user's vote (and change state of buttons accordingly)
  fetchPostVote(user, post) {
    let check_state = {
      user_id: null,
      post_id: this.props.id
    };
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
      });
    });
  };

  // edit post function, called by handleSubmit in PostFormContainer child
  editPost(formPayload) {
    let post_id = this.props.id;
    fetch(`/api/v1/posts/${post_id}`, {
      credentials: 'same-origin',
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json'},
      body: JSON.stringify(formPayload)
    })
    .then(response => response.json())
    .then(data => {
      this.setState({post: data});
      this.props.fetchForum();
    });
  };

  // toggles PostFormContainer child appearance
  handleEditClick(event) {
    event.preventDefault();
    this.setState({edit: true});
  };


  render(){
    let id = this.props.id;
    let created_at = this.props.created_at;

    let buttons;
    // edit and delete buttons only appear if user made original comment
    if(this.props.current_user.id == this.props.user.id) {
      buttons =
      <div style={{float: "left"}}>
        <button style={{backgroundColor: "#00B200", marginRight: "10px"}} onClick={this.handleEditClick}>
          Edit
        </button>
        <button style={{backgroundColor: "#333333"}} onClick={this.props.handleDelete}>
          Delete
        </button>
      </div>
    };

    // toggles CommentFormContainer child appearance
    let editForm;
    if(this.state.edit) {
      editForm =
      <div>
        <br/>
        <br/>
        <br/>
        <PostFormContainer
          addNewPost={this.editPost}
          current_user={this.props.current_user}
          forum_id={this.props.forum_id}
        />
      </div>
    };

    return(
      <div className="grid-x" id="tile">
        <div className="small-4" id={this.props.post_type}>
        </div>
        <div className="small-8" id="tileInfo">
          <div id="link">
            <Link to={`/posts/${id}`}> {this.props.title} </Link>
          </div>
          <div>
            Made by {this.props.user.handle} on {new Date(this.props.created_at).toString().substring(3,15)}
            <span>
              <p>Karma: {this.state.karma} | Comments: {this.props.comments.length}</p>
            </span>
            {buttons}
          </div>
          {editForm}
        </div>
        <hr/>
      </div>
    );
  };
};

export default PostTile;
