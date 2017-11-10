import React from 'react';
import ForumIndexContainer from './ForumIndexContainer';

class IllnessShowContainer extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      illness: {forums: []},
    }
  }

  componentDidMount() {
    let illnessId = this.props.params.id
    fetch(`/api/v1/illnesses/${illnessId}`)
    .then(response => response.json())
    .then(data => {
      this.setState({
        illness: data.illness,
      })
    })
  }

  render(){
    debugger;
    let forumIndex;
    if(this.state.illness["forums"].length > 0){
      forumIndex =
      <ForumIndexContainer
        forums={this.state.illness["forums"]}
      />
    }
    return(
      <div>
        <div id="intro">
          <h1>
            {this.state.illness.name}
          </h1>
          <hr/>
          <h3>
            {this.state.illness.description}
          </h3>
          <hr/>
          <p>
            <a href={this.state.illness.infourl} target="_blank">Click here for more information about {this.state.illness.name}</a>
          </p>
          <hr/>
          <p>
            <a href={this.state.illness.trialurl} target="_blank">Click here for current clinical trials recruiting patients with {this.state.illness.name}</a>
          </p>
        </div>
        <hr/>
        {forumIndex}
      </div>
    )
  }
}

export default IllnessShowContainer;
