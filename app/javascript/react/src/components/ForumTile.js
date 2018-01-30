import React from 'react';
import { Link } from 'react-router';

// child of ForumIndexContainer
const ForumTile = (props) => {
  return(
    <div className="grid-x" id="tile">
      <div className="small-12" id="link">
        <Link to={`/forums/${props.id}`}> {props.name} </Link>
      </div>
      <div className="small-12">
        {props.description}
      </div>
      <hr/>
    </div>
  );
};

export default ForumTile;
