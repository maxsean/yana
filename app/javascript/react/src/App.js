import React from 'react';
import { Route, IndexRoute, Router, browserHistory} from 'react-router';
import WelcomeContainer from './containers/WelcomeContainer'
import SignUpFormContainer from './containers/SignUpFormContainer';
import LoginFormContainer from './containers/LoginFormContainer';
import NavBar from './components/NavBar'

const App = (props) => {
  return(
    <div>
      <Router history={browserHistory}>
        <Route path='/' component={NavBar}>
          <IndexRoute component={WelcomeContainer} />
          <Route path='/signup' component={SignUpFormContainer}/>
          <Route path='/login' component={LoginFormContainer}/>
        </Route>
      </Router>
    </div>
  )
}

export default App
