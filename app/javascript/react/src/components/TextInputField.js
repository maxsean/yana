import React from 'react';

// used in form containers
const TextInputField = props => {
  return(
    <label style={{fontSize:"16px"}} onChange={props.handleChange}>{props.label}
    <input style={{width: "100%", height: "24px"}}
      id={props.name}
      name={props.name}
      type={props.type}
      value={props.content}
    />
    </label>
  )
}

export default TextInputField;
