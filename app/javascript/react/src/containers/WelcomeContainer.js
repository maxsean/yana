import React, {Component} from 'react';
import { Link } from 'react-router';

class WelcomeContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      current_user: {}
    }
  }

  componentDidMount() {
    this.fetchCurrentUser()
  }

  fetchCurrentUser() {
    fetch('/api/v1/users.json', {
      credentials: 'same-origin',
      method: 'GET',
      headers: { 'Content-Type': 'application/json' }
    })
    .then(response => response.json())
    .then(data => {
      this.setState({ current_user: data.user });
    })
  }


  render() {
    let display;
    // only appears if user signs in
    if(this.state.current_user.id){
      display =
      <div>
        <div id="intro">
          <h1>YANA</h1>
          <p>Share.Support.Learn</p>
          <hr/>
          <p>
            YANA is an online support system for patients with chronic illnesses, their loved ones, and medical professionals to share stories, ask for help, and learn about new medical advances.
          </p>
        </div>
        <br/>
        <div className='button-group'>
          <button>
            <Link to='/illnesses'> Explore Illnesses </Link>
          </button>
          <button>
            <Link to='/surveys'> Explore Surveys </Link>
          </button>
          <button>
            <a href='/charts'> Explore Charts </a>
          </button>
        </div>
      </div>
    }

    return(
      <div className="grid-x">
        <br/>
        <div className="welcomeQuote">
          <div id="index">
            {display}
          </div>
        </div>
      </div>
    )
  }
}

export default WelcomeContainer;
