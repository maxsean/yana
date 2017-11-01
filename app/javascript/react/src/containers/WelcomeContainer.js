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
          <blockquote>
            <q>Our uniqueness makes us special, makes perception valuable. But it can also make us lonely. This loneliness is different from being alone: You can be lonely even surrounded by people. The feeling I am talking about stems from the sense that we can never fully share the truth of who we are.</q>
            <em> - Amy Tan</em>
          </blockquote>
        </div>

          <Link path='/about' className="link">
          <div className="small-5 large-2 cell" id="welcomeLeft">
            About
          </div>
          </Link>
          <Link path='/help' className="link">
            <div className="small-5 large-2 cell" id="welcomeRight">
              Help
           </div>
          </Link>
        <br/>
        <br/>
          <Link to='/signup' className="link">
            <div className="small-5 large-3 cell" id="welcomeLeft">
              Sign Up
            </div>
          </Link>
          <Link path='/news' className="link">
            <div className="small-5 large-3 cell" id="welcomeRight">
              News
            </div>
          </Link>
        <br/>
        <br/>
          <Link path='/contact' className="link">
            <div className="small-5 large-4 cell" id="welcomeLeft">
              Contact
            </div>
          </Link>
          <Link path='/demo' className="link">
            <div className="small-5 large-4 cell" id="welcomeRight">
              Demo
            </div>
          </Link>
      </div>
    )
  }
}

export default WelcomeContainer;
