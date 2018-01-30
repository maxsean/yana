import React from 'react';
import ForumTile from '../components/ForumTile';

// child of IllnessShowContainer
class ForumIndexContainer extends React.Component{
  constructor(props) {
    super(props);
  };
  render() {
    // consider refactoring to just pass whole forum
    let forums = this.props.forums.map(forum => {
      return(
        <ForumTile
          key={String(Date.now()) + '-' + forum.id}
          id={forum.id}
          name={forum.name}
          description={forum.description}
        />
      );
    });
    return(
      <div>
        <div id="intro">
          <h2>
            Forums
          </h2>
        </div>
        <div id="index">
          {forums}
        </div>
      </div>
    );
  };
};

export default ForumIndexContainer;
