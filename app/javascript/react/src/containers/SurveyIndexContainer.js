import React from 'react';
import SurveyTile from '../components/SurveyTile'

class SurveyIndexContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      surveys: {}
    }
  }

  componentDidMount() {
    this.fetchSurveys()
  }

  fetchSurveys() {
    fetch('/api/v1/surveys')
    .then(response => response.json())
    .then(data => {
      this.setState({surveys: data})
    })
  }

  render() {
    let surveys;
    if (this.state.surveys.length > 0) {
      surveys = this.state.surveys.map(survey => {
        return(
          <SurveyTile
            key={String(Date.now()) + '-' + survey.id}
            id={survey.id}
            title={survey.title}
            description={survey.description}
          />
        )
      })
    }
    return(
      <div>
        <div id="intro">
          <h1>
            Surveys
          </h1>
        </div>
        <div id="index">
          {surveys}
        </div>
      </div>
    )
  }
}

export default SurveyIndexContainer;
