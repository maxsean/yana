import React from 'react';
import { Route, IndexRoute, Router, browserHistory} from 'react-router';
import WelcomeContainer from './containers/WelcomeContainer';
import SignUpFormContainer from './containers/SignUpFormContainer';
import NavBar from './components/NavBar';
import AboutContainer from './containers/AboutContainer';
import HelpContainer from './containers/HelpContainer';
import NewsContainer from './containers/NewsContainer';
import DemoContainer from './containers/DemoContainer';
import ContactContainer from './containers/ContactContainer';

const App = (props) => {
  return(
    <div>
      <Router history={browserHistory}>
        <Route path='/' component={NavBar}>
          <IndexRoute component={WelcomeContainer} />
          <Route path='/signup' component={SignUpFormContainer}/>
          <Route path='/about' component={AboutContainer}/>
          <Route path='/help' component={HelpContainer}/>
          <Route path='/news' component={NewsContainer}/>
          <Route path='/demo' component={DemoContainer}/>
          <Route path='/contact' component={ContactContainer}/>
        </Route>
      </Router>
    </div>
  )
}

export default App
