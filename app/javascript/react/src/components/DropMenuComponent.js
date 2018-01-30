import React from 'react';

const DropMenuContainer = props => {
  return(
    <label>{props.label}
      <select name="post_type" onChange={props.handleChange}>
        <option value="">Select Reason</option>
        <option name="post_type" value="story">Share a Story</option>
        <option name="post_type" value="help">Ask for Help</option>
        <option name="post_type" value="news">Announce Medical News</option>
      </select>
    </label>
  );
};
export default DropMenuContainer;
