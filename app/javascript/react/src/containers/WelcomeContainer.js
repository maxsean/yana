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
    let buttons;
    if(this.state.current_user.id){
      buttons =
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
    }

    return(
      <div className="grid-x">
        <div className="welcomeQuote">
          <br />
          <br />
          <br />
          <div className="welcomeImage">
            <div className="small-4" id="logoImage">
            </div>
            <div className="small-8">
              <h1>YANA</h1>
              <h2>Share. Support. Learn</h2>
            </div>
          </div>
          <div id="index">
            {buttons}
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
