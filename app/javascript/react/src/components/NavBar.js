import React from 'react';
import { Link } from 'react-router';
import BackButton from './Backbutton'

const NavBar = props => {
  return(
    <div>
      <div className="navBar">
        <BackButton className="backButton"/>
        <Link to='/' className="home"> YANA </Link>
        <Link to='/signup' className="registration"> Sign Up </Link>
      </div>
        {props.children}
    </div>
  )
}

export default NavBar;
