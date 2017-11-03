import React from 'react';
import BackButton from '../components/BackButton';
import PostIndexContainer from './PostIndexContainer';
import PostFormContainer from './PostFormContainer';
import FormErrors from '../components/FormErrors'

class ForumShowContainer extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      forum: {},
      posts: [],
      current_user: {},
      errors: {}
    }
    this.addNewPost = this.addNewPost.bind(this)
  }

  componentDidMount() {
    this.fetchCurrentUser();
    this.fetchForum()
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

  fetchForum() {
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

  addNewPost(formPayload) {
    fetch('/api/v1/posts', {
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
          posts: data.posts
        })
      }
    })
  }

  render(){
    let errors;
    if(this.state.errors != {}){
      errors = <FormErrors formErrors={this.state.errors}/>
    }

    let postIndex;
    if(this.state.posts.length > 0){
      postIndex =
      <PostIndexContainer
        posts={this.state.posts}
        addNewPost={this.addNewPost}
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
        <div style={{paddingLeft:'25%'}}>
          {errors}
          <PostFormContainer
            addNewPost={this.addNewPost}
            current_user={this.state.current_user}
            forum_id={this.props.params.id}
          />
        </div>
          {postIndex}
      </div>
    )
  }
}

export default ForumShowContainer;
