import React from 'react';
import IllnessTile from '../components/IllnessTile.js';
import BackButton from '../components/BackButton'

class IllnessIndexContainer extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      illnesses: [],
    }
  }

  componentDidMount() {
    fetch("api/v1/illnesses")
    .then(response => response.json())
    .then(data => {
      this.setState({
        illnesses: data,
      })
    })
  }

  render(){
    let illnesses;
    if (this.state.illnesses.length > 0) {
      illnesses = this.state.illnesses.map(illness => {
        return(
          <IllnessTile
            key={String(Date.now()) + '-' + illness.id}
            id={illness.id}
            name={illness.name}
            description={illness.description}
          />
        )
      })
    }
    return(
      <div>
        <div id="intro">
          <h1>
            Explore our Communities!
          </h1>
        </div>
        <div id="index">
          {illnesses}
        </div>
      </div>
    )
  }
}

export default IllnessIndexContainer;
