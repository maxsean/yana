import React from 'react';
import CommentFormContainer from '../containers/CommentFormContainer'

// child of CommentIndexContainer
class CommentTile extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      edit: false,
      comment: this.props.comment
    }
    this.handleEditClick = this.handleEditClick.bind(this)
    this.editComment = this.editComment.bind(this)
  }

// make sure component rerenders when user submits new comment, or edits/delete
  componentWillReceiveProps(nextProps) {
    this.setState({ comment: nextProps.comment });
  }

// edit comment function, called by handleSubmit in CommentFormContainer child
  editComment(formPayload) {
    let comment_id = this.props.id
    fetch(`/api/v1/comments/${comment_id}`, {
      credentials: 'same-origin',
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json'},
      body: JSON.stringify(formPayload)
    })
    .then(response => response.json())
    .then(data => {
      this.setState({comment: data})
      this.props.fetchPost()
    })
  }

// toggles CommentFormContainer child appearance
  handleEditClick(event) {
    event.preventDefault()
    this.setState({edit: true})
  }

  render(){
    let body = this.props.body
    let created_at = this.props.created_at
    let buttons;

    // edit and delete buttons only appear if user made original comment
    if(this.props.current_user.id == this.props.user.id){
      buttons =
      <div style={{float: "left"}}>
        <button style={{backgroundColor: "#00B200", marginRight: "10px"}} onClick={this.handleEditClick}>
          Edit
        </button>
        <button style={{backgroundColor: "#333333"}} onClick={this.props.handleDelete}>
          Delete
        </button>
      </div>
    }

    // toggles CommentFormContainer child appearance
    let editForm;
    if(this.state.edit){
      editForm =
      <div>
        <br/>
        <br/>
        <br/>
        <CommentFormContainer
          addNewComment={this.editComment}
          current_user={this.props.current_user}
          post_id={this.props.post_id}
        />
      </div>
    }

    return(
      <div className="grid-x" id="tile">
        <div className="small-12">
          <p>{body}</p>
        </div>
        <div className="small-12">
          Made by {this.props.user.handle} on {Date(created_at).toString().substring(3,15)}
          <br/>
          <br/>
          {buttons}
          {editForm}
        </div>
        <hr/>
      </div>
    )
  }
}

export default CommentTile;
