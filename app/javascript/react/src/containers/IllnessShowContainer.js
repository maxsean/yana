import React from 'react';
import ForumIndexContainer from './ForumIndexContainer';
import BackButton from '../components/BackButton'

class IllnessShowContainer extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      illness: {},
      forums: []
    }
  }

  componentDidMount() {
    let illnessId = this.props.params.id
    fetch(`/api/v1/illnesses/${illnessId}`)
    .then(response => response.json())
    .then(data => {
      this.setState({
        illness: data.illness,
        forums: data.forums
      })
    })
  }

  render(){
    let forumIndex;
    if(this.state.forums.length > 0){
      forumIndex =
      <ForumIndexContainer
        forums={this.state.forums}
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
        </div>
        <hr/>
        {forumIndex}
      </div>
    )
  }
}

export default IllnessShowContainer;
