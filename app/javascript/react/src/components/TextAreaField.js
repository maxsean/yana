import React from 'react';

const TextAreaField = props => {
  return(
    <label onChange={props.handleChange}>{props.label}
    <textarea
      className="area"
      id={props.name}
      name={props.name}
      type='text'
      value={props.content}
    />
    </label>
  )
}

export default TextAreaField;
