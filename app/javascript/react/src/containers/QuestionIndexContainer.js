import React from 'react';
import QuestionTile from '../components/QuestionTile';
import { Link } from 'react-router'

class QuestionIndexContainer extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      payload: {},
      checked: {},
      submitted: false
    }
    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleChange = this.handleChange.bind(this)
    this.clearForm = this.clearForm.bind(this)
  }

  clearForm() {
    this.setState({
      payload: {},
      checked: {},
    })
  }

  handleChange(event) {
    let payload = this.state.payload
    let checked = this.state.checked
    let id = event.target.id
    let value = event.target.value
    payload[id] = value
    checked[id] = value
    this.setState({
      payload: payload,
      checked: checked
    })
  }

  handleSubmit(event) {
    event.preventDefault()
    let formPayload = {
      payload: this.state.payload
    }
    this.props.addNewSubmission(formPayload)
    this.clearForm()
    this.setState({ submitted: true })
  }

  render() {
    let questions = this.props.questions.map(question => {
      return(
        <QuestionTile
          key={String(Date.now()) + '-' + question.id}
          id={question.id}
          label={question.body}
          choices={question.choices}
          handleChange={this.handleChange}
          checked={this.state.checked}
        />
      )
    })
    let buttonLinks;
    if(this.state.submitted){
      buttonLinks =
      <div className='button-group'>
        <button>
          <Link to='/surveys'> Back to Surveys </Link>
        </button>
        <button>
          <Link to='/illnesses'> Back to Illnesses </Link>
        </button>
        <button>
          <a href='/charts'> Go to Chart </a>
        </button>
      </div>
    }
    return(
      <div id="index">
        <form onSubmit={this.handleSubmit}>
          {questions}
          <div className='button-group'>
            <input className='button' type='submit' value='Submit' />
          </div>
          {buttonLinks}
        </form>
      </div>
    )
  }
}

export default QuestionIndexContainer
