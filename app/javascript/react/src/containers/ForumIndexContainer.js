import React from 'react'
import ForumTile from '../components/ForumTile'

class ForumIndexContainer extends React.Component{
  constructor(props){
    super(props);
    this.state = {

    }
  }
  render(){
    let forums = this.props.forums.map(forum => {
      return(
        <ForumTile
          key={String(Date.now()) + '-' + forum.id}
          id={forum.id}
          name={forum.name}
          description={forum.description}
        />
      )
    })
    return(
      <div id="index">
        {forums}
      </div>
    )
  }
}

export default ForumIndexContainer
