import React from 'react';

const CommentTile = (props) => {
  let body = props.body
  let created_at = props.created_at
  return(
    <div className="grid-x" id="tile">
      <div className="small-12">
        <p>{body}</p>
      </div>
      <div className="small-12">
        Made by {props.user.handle} on {Date(created_at).toString().substring(3,15)}
      </div>
      <hr/>
    </div>
  )
}

export default CommentTile;
