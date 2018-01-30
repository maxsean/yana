import React from 'react';
import QuestionTile from '../components/QuestionTile';
import { Link } from 'react-router'

// child of SurveyShowContainer
class QuestionIndexContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      payload: {},
      checked: {},
      submitted: false
    };
    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleChange = this.handleChange.bind(this)
    this.clearForm = this.clearForm.bind(this)
  };

  clearForm() {
    this.setState({
      payload: {},
      checked: {},
    });
  };

  // payload is actually a hash where question id and and choice id are appended to as key-value pairs; checked is also the same to keep track of which radio button should be given checked state
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
    });
  };

  handleSubmit(event) {
    event.preventDefault();
    let formPayload = {
      payload: this.state.payload
    };
    this.props.addNewSubmission(formPayload)
    this.clearForm()
    this.setState({ submitted: true })
  };

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
      );
    });
    // only appears after survey is submitted
    let buttonLinks;
    if(this.state.submitted) {
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
    } else {
      buttonLinks =
      <div className='button-group'>
        <input className='button' type='submit' value='Submit' />
      </div>
    };
    return(
      <div id="index" style={{overflow: "scroll", height: "450px"}}>
        <form onSubmit={this.handleSubmit}>
          {questions}
          {buttonLinks}
        </form>
      </div>
    );
  };
};

export default QuestionIndexContainer;
