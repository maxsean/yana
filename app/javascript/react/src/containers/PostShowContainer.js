import React from 'react';
import CommentIndexContainer from './CommentIndexContainer';
import CommentFormContainer from './CommentFormContainer';
import FormErrors from '../components/FormErrors'

class PostShowContainer extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      post: {},
      comments: [],
      post_user: {},
      current_user: {},
      errors: {},
      disabledUpvote: false,
      disabledDownvote: false,
      karma: 0,
      upvote: 0,
      downvote: 0
    }
    this.addNewComment = this.addNewComment.bind(this);
    this.handleUpvoteClicked = this.handleUpvoteClicked.bind(this);
    this.handleDownvoteClicked = this.handleDownvoteClicked.bind(this);
    this.handleClearClicked = this.handleClearClicked.bind(this);
    this.deleteComment = this.deleteComment.bind(this);
  }

  componentDidMount() {
    this.fetchCurrentUser();
    this.fetchPost()
  }

  fetchPost() {
    let postId = this.props.params.id
    fetch(`/api/v1/posts/${postId}`)
    .then(response => response.json())
    .then(data => {
      let post = JSON.parse(data.post)
      let comments = JSON.parse(data.comments)
      this.setState({
        post: post,
        comments: comments,
        post_user: post.user
      })
    })
  }

  fetchCurrentUser() {
    fetch('/api/v1/users.json', {
      credentials: 'same-origin',
      method: 'GET',
      headers: { 'Content-Type': 'application/json' }
    })
    .then(response => response.json())
    .then(data => {
      this.setState({ current_user: data.user });
      this.fetchPostVote(data.user.id, this.props.params.id)
    })
  }

  fetchPostVote(user, post) {
    let check_state = {
      user_id: user,
      post_id: post
    }
    fetch('/api/v1/post_votes', {
      method: "POST",
      body: JSON.stringify(check_state)
    })
    .then(response => response.json())
    .then(data => {
      if(data["value"] == -1) {
        this.setState({
          disabledUpvote: false,
          disabledDownvote: true
        })
      } else if(data["value"] == 0) {
        this.setState({
          disabledUpvote: false,
          disabledDownvote: false
        })
      } else if(data["value"] == 1) {
        this.setState({
          disabledUpvote: true,
          disabledDownvote: false
        })
      }
      this.setState({
        karma: data["karma"],
        upvote: data["upvote"],
        downvote: data["downvote"]
      })
    })
  }

  handleUpvoteClicked() {
    if (!this.state.disabledUpvote) {
      this.setState({
        disabledUpvote: true,
        disabledDownvote: false
      });
      let vote = {
        user_id: this.state.current_user.id,
        post_id: this.props.params.id,
        value: 1
      }
      let postId = this.props.params.id
      fetch(`/api/v1/post_votes/${postId}`, {
        method: "PATCH",
        body: JSON.stringify(vote)}
      )
      .then(response => response.json())
      .then(data => {
        this.setState({
          karma: data["karma"],
          upvote: data["upvote"],
          downvote: data["downvote"]
        })
      })
    }
  }

  handleDownvoteClicked() {
    if (!this.state.disabledDownvote) {
      this.setState({
        disabledUpvote: false,
        disabledDownvote: true
      });
      let vote = {
        user_id: this.state.current_user.id,
        post_id: this.props.params.id,
        value: -1
      }
      let postId = this.props.params.id
      fetch(`/api/v1/post_votes/${postId}`, {
        method: "PATCH",
        body: JSON.stringify(vote)}
      )
      .then(response => response.json())
      .then(data => {
        this.setState({
          karma: data["karma"],
          upvote: data["upvote"],
          downvote: data["downvote"]
        })
      })
    }
  }

  handleClearClicked() {
    this.setState({
      disabledUpvote: false,
      disabledDownvote: false
    });
    let vote = {
      user_id: this.state.current_user.id,
      post_id: this.props.params.id,
      value: 0
    }
    let postId = this.props.params.id
    fetch(`/api/v1/post_votes/${postId}`, {
      method: "PATCH",
      body: JSON.stringify(vote)}
    )
    .then(response => response.json())
    .then(data => {
      this.setState({
        karma: data["karma"],
        upvote: data["upvote"],
        downvote: data["downvote"]
      })
    })
  }

  addNewComment(formPayload) {
    fetch('/api/v1/comments', {
      credentials: 'same-origin',
      method: 'POST',
      headers: { 'Content-Type': 'application/json'},
      body: JSON.stringify(formPayload)
    })
    .then(response => { return response.json() })
    .then(data => {
      if (data.error) {
        this.setState({ errors: data.error })
    } else {
        let comments = JSON.parse(data.comments)
        this.setState({
          errors: data.messages,
          comments: comments
        })
      }
    })
  }

  deleteComment(id){
    fetch(`/api/v1/comments/${id}`, {
      method: 'DELETE'
    })
    .then(() => {
      this.fetchPost()
    })
  }

  render(){
    let errors;
    if(this.state.errors.body){
      errors = <FormErrors formErrors={this.state.errors}/>
    }

    let commentForm =
      <h3>Sign in or sign up to leave a comment</h3>
    if(this.state.current_user.id){
      commentForm =
      <CommentFormContainer
        addNewComment={this.addNewComment}
        current_user={this.state.current_user}
        post_id={this.props.params.id}
      />
    }

    let commentIndex;
    if(this.state.comments.length > 0){
      commentIndex =
      <CommentIndexContainer
        comments={this.state.comments}
        current_user={this.state.current_user}
        deleteComment={this.deleteComment}
      />
    }

    let vote;
    if(this.state.current_user.id) {
      vote =
      <div className="vote-group">
        <button
          id="Upvote"
          disabled={this.state.disabledUpvote}
          onClick={this.handleUpvoteClicked}
          ><img src="/assets/images/upvote.png"/>({this.state.upvote})</button>
        <button
          id="Downvote"
          disabled={this.state.disabledDownvote}
          onClick={this.handleDownvoteClicked}
          ><img src="/assets/images/downvote.png"/>({this.state.downvote})</button>
        <button
          id="Clear"
          onClick={this.handleClearClicked}
          >Clear Vote</button>
      </div>
    }

    return(
      <div>
        <div id="intro">
          <h1>
            {this.state.post.title}
          </h1>
          <hr/>
          <p>
            {this.state.post.body}
          </p>
          <hr/>
          <div>
            <p>
              Made by {this.state.post_user.handle} on {Date(this.props.created_at).toString().substring(3,15)}
            </p>
            <h2>Karma: {this.state.karma}</h2>
            {vote}
          </div>
        </div>
        <br/>
        <div style={{paddingLeft:'25%'}}>
          {errors}
          {commentForm}
        </div>
        <br/>
          {commentIndex}
      </div>
    )
  }
}

export default PostShowContainer;
