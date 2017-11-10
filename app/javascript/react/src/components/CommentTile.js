import React from 'react';

const CommentTile = (props) => {
  let body = props.body
  let created_at = props.created_at
  let buttons;
  if(props.current_user.id == props.user.id){
    buttons =
    <div style={{float: "left"}}>
      <button style={{backgroundColor: "#00B200", marginRight: "10px"}}>
        Edit
      </button>
      <button style={{backgroundColor: "#333333"}} onClick={props.handleDelete}>
        Delete
      </button>
    </div>
  }

  return(
    <div className="grid-x" id="tile">
      <div className="small-12">
        <p>{body}</p>
      </div>
      <div className="small-12">
        Made by {props.user.handle} on {Date(created_at).toString().substring(3,15)}
        <br/>
        <br/>
        {buttons}
      </div>
      <hr/>
    </div>
  )
}

export default CommentTile;
