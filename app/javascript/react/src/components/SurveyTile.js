import React from 'react';
import { Link } from 'react-router';

// child of SurveyIndexContainer
const SurveyTile = (props) => {
  return(
    <div className="grid-x" id="tile">
      <div className="small-12" id="link">
        <Link to={`/surveys/${props.id}`}> {props.title} </Link>
      </div>
      <div className="small-12">
        {props.description}
      </div>
      <hr/>
    </div>
  )
}

export default SurveyTile;
