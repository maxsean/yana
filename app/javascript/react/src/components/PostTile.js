import React from 'react';
import { Link } from 'react-router';
import CommentIndexContainer from '../containers/CommentIndexContainer';

class PostTile extends React.Component {
  constructor(props){
    super(props);
    this.state = {

    }
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
        <hr/>
      </div>
    )
  }
}

export default PostTile;
