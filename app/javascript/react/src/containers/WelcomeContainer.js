import React, {Component} from 'react';
import { Link } from 'react-router';

class WelcomeContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {

    }
  }

  render() {
    return(
      <div className="welcomeContainer">
        <div className="welcomeImageDiv">
          <img/>
        </div>
        <div className="welcomeTopLeft">
          <Link path='/about'> About </Link>
        </div>
        <div className="welcomeMidLeft">
          <Link to='/signup' className="registration"> Sign Up </Link>
        </div>
        <div className="welcomeBotLeft">
          <Link path='/contact'> Contact </Link>
        </div>
        <div className="welcomeTopRight">
          <Link path='/help'> Help </Link>
        </div>
        <div className="welcomeMidRight">
          <Link path='/news'> News </Link>
        </div>
        <div className="welcomeBotRight">
          <Link path='/demo'> Demo </Link>
        </div>
      </div>
    )
  }
}

export default WelcomeContainer;
