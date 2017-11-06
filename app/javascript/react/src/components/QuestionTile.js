import React from 'react'

const QuestionTile = (props) => {
  let choices = props.choices.map(choice => {
    return(
      <div>
        <input
          key={String(Date.now()) + '-' + choice.id}
          type="radio"
          value={choice.id}
          id={props.id}
          onChange={props.handleChange}
          checked={props.checked[props.id]===String(choice.id)}
        />
        {" "+choice.body+" "}
      </div>
    )
  })

  return(
    <div id="tile">
      <label> {props.label}
        <br />
        {choices}
      </label>
      <hr />
    </div>
  )
}

export default QuestionTile
