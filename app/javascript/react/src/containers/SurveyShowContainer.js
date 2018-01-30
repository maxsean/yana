import React from 'react'
import QuestionIndexContainer from './QuestionIndexContainer';
import FormErrors from '../components/FormErrors';

class SurveyShowContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      survey: {},
      current_user: {},
      errors: {}
    };
    this.addNewSubmission = this.addNewSubmission.bind(this);
  };

  componentDidMount() {
    this.fetchCurrentUser();
    this.fetchSurvey();
  };

  fetchCurrentUser() {
    fetch('/api/v1/users.json', {
      credentials: 'same-origin',
      method: 'GET',
      headers: { 'Content-Type': 'application/json' }
    })
    .then(response => response.json())
    .then(data => {
      this.setState({ current_user: data.user });
    });
  };

  fetchSurvey() {
    fetch(`/api/v1/surveys/${this.props.params.id}`)
    .then(response => response.json())
    .then(data => {
      this.setState({
        survey: data
      });
    });
  };

  // triggered by QuestionIndexContainer child
  addNewSubmission(formPayload) {
    fetch('/api/v1/submissions', {
      credentials: 'same-origin',
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(formPayload)
    })
    .then(response => response.json())
    .then(data => {
      this.setState({
        errors: data.messages
      });
    });
  };

  render() {
    // only appears if backend sends errors or messages
    let errors;
    if(this.state.errors != {}){
      errors = <FormErrors formErrors={this.state.errors}/>
    };

    let questions;
    if (this.state.survey.id) {
      questions =
      <QuestionIndexContainer
        questions={this.state.survey.questions}
        current_user={this.state.current_user}
        addNewSubmission={this.addNewSubmission}
      />
    };
    return(
      <div>
        <div id="intro">
          <h1>
            {this.state.survey.title}
          </h1>
          <hr/>
          <h3>
            {this.state.survey.description}
          </h3>
          {errors}
        </div>
        <hr/>
        {questions}
      </div>
    );
  };
};

export default SurveyShowContainer;
