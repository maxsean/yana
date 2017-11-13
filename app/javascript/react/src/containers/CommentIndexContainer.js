import React from 'react'
import CommentTile from '../components/CommentTile'

class CommentIndexContainer extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      comments: {}
    }
  }

  componentWillReceiveProps(nextProps) {
    this.setState({ comments: nextProps.comments })
  }

  handleDelete(id) {
    this.props.deleteComment(id)
  }

  render(){
    let comments = this.props.comments.map(comment => {
      return(
        <CommentTile
          key={String(Date.now()) + '-' + comment.id}
          id={comment.id}
          body={comment.body}
          user={comment.user}
          created_at={comment.created_at}
          current_user={this.props.current_user}
          handleDelete={() => this.handleDelete(comment.id)}
          comment={comment}
          fetchPost={this.props.fetchPost}
          post_id={this.props.post_id}
        />
      )
    })

    return(
      <div>
        <span id="index">
          <h3>
            Comments
          </h3>
        </span>
        {comments}
      </div>
    )
  }
}

export default CommentIndexContainer;
