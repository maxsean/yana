import React from 'react';
import BackButton from '../components/BackButton';
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
      errors: {}
    }
    this.addNewComment = this.addNewComment.bind(this)
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
      this.setState({
        post: data.post,
        comments: data.comments,
        post_user: data.post_user
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
        this.setState({
          errors: data.messages,
          comments: data.comments
        })
      }
    })
  }


  render(){
    let errors;
    if(this.state.errors != {}){
      errors = <FormErrors formErrors={this.state.errors}/>
    }

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
        </div>
        <hr/>
        <div style={{paddingLeft:'25%'}}>
          {errors}
          <CommentFormContainer
            addNewComment={this.addNewComment}
            current_user={this.state.current_user}
            post_id={this.props.params.id}
          />
        </div>
          {commentIndex}
      </div>
    )
  }
}

export default PostShowContainer;
