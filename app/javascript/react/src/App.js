import React from 'react';
import { Route, IndexRoute, Router, browserHistory} from 'react-router';
import WelcomeContainer from './containers/WelcomeContainer';
import SignUpFormContainer from './containers/SignUpFormContainer';
import IllnessIndexContainer from './containers/IllnessIndexContainer';
import IllnessShowContainer from './containers/IllnessShowContainer';
import ForumShowContainer from './containers/ForumShowContainer';
import PostShowContainer from './containers/PostShowContainer';
import SurveyIndexContainer from './containers/SurveyIndexContainer';
import SurveyShowContainer from './containers/SurveyShowContainer';

const App = (props) => {
  return(
    <div>
      <Router history={browserHistory}>
        <Route path='/'>
          <IndexRoute component={WelcomeContainer} />
          <Route path='/signup' component={SignUpFormContainer}/>
          <Route path='/illnesses' component={IllnessIndexContainer}/>
          <Route path='/illnesses/:id' component={IllnessShowContainer}/>
          <Route path='/forums/:id' component={ForumShowContainer}/>
          <Route path='/posts/:id' component={PostShowContainer}/>
          <Route path='/surveys' component={SurveyIndexContainer}/>
          <Route path='/surveys/:id' component={SurveyShowContainer}/>
        </Route>
      </Router>
    </div>
  );
};

export default App;
