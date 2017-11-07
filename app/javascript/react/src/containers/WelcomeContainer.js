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
      <div className="grid-x">
        <div className="welcomeQuote">
          <br />
          <br />
          <br />
          <div className="welcomeImage">
            <h1>YANA</h1>
            <br />
            <h2>Share. Support. Learn</h2>
          </div>
          <blockquote>
            <q>Our uniqueness makes us special, makes perception valuable. But it can also make us lonely. This loneliness is different from being alone: You can be lonely even surrounded by people. The feeling I am talking about stems from the sense that we can never fully share the truth of who we are.</q>
            <em> - Amy Tan</em>
          </blockquote>
        </div>
      </div>
    )
  }
}

export default WelcomeContainer;
