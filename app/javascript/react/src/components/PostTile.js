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
    return(
      <div className="grid-x" id="tile">
        <div className="small-12" id="link">
          <Link to={`/posts/${id}`}> {this.props.title} </Link>
        </div>
        <div className="small-12">
          {this.props.body}
        </div>
        <hr/>
      </div>
    )
  }
}

export default PostTile;
