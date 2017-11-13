import React from 'react';
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
    this.deletePost = this.deletePost.bind(this)
    this.fetchForum = this.fetchForum.bind(this)
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
      let posts = JSON.parse(data.posts)
      this.setState({
        forum: data.forum,
        posts: posts
      })
    })
  }

  // triggered by handleSubmit in child PostFormContainer
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
      let posts = JSON.parse(data.posts)
        this.setState({
          errors: data.messages,
          posts: posts
        })
      }
    })
  }

  // triggered by PostTile child in PostIndexContainer child
  deletePost(id){
    fetch(`/api/v1/posts/${id}`, {
      method: 'DELETE'
    })
    .then(() => {
      this.fetchForum()
    })
  }

  render(){
    // only appears if backend returns errors or messages
    let errors;
    if(this.state.errors != {}){
      errors = <FormErrors formErrors={this.state.errors}/>
    }

    // only appears if user is signed in
    let postForm =
      <div style={{paddingLeft: "12.5%"}}>
        <h3 style={{color: "#800000"}}>Sign in or sign up to make a post</h3>
        <br/>
      </div>
    if(this.state.current_user.id) {
      postForm =
      <PostFormContainer
        addNewPost={this.addNewPost}
        current_user={this.state.current_user}
        forum_id={this.props.params.id}
      />
    }
    // only appears if forum has posts
    let postIndex;
    if(this.state.posts.length > 0){
      postIndex =
      <PostIndexContainer
        posts={this.state.posts}
        addNewPost={this.addNewPost}
        current_user={this.state.current_user}
        deletePost={this.deletePost}
        fetchForum={this.fetchForum}
        forum_id={this.props.params.id}
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
        <div style={{paddingLeft:'25%'}}>
          {errors}
          {postForm}
        </div>
          {postIndex}
      </div>
    )
  }
}

export default ForumShowContainer;
