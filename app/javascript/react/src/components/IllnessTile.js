import React from 'react';
import { Link } from 'react-router';

// child of IllnessIndexContainer
const IllnessTile = (props) => {
  return(
    <div className="grid-x" id="tile">
      <div className="small-12" id="link">
        <Link to={`/illnesses/${props.id}`}> {props.name} </Link>
      </div>
      <div className="small-12">
        {props.description}
      </div>
      <hr/>
    </div>
  );
};

export default IllnessTile;
