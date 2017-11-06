import React from 'react';
import { Link } from 'react-router';
import BackButton from './BackButton'

const NavBar = props => {
  return(
    <div>
      <div className="navBar">
        <Link to='/' className="home"> YANA </Link>
        <Link to='/illnesses'> Explore </Link>
        <Link to='/surveys'> Surveys </Link>
        <div id="BackButton">
          <BackButton/>
        </div>
        <a href='/charts'><p>Charts</p></a>
      </div>
        {props.children}
    </div>
  )
}

export default NavBar;
