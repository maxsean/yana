import React from 'react';
import TextInputField from '../components/TextInputField';
import TextAreaField from '../components/TextAreaField';

class CommentFormContainer extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      body: "",
      post_id: this.props.post_id,
      user_id: this.props.current_user.id
    }
    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleChange = this.handleChange.bind(this)
    this.clearForm = this.clearForm.bind(this)
  }

  componentWillReceiveProps(nextProps) {
    this.setState({ user_id: nextProps.current_user.id });
  }

  clearForm() {
    this.setState({
      body: "",
    })
  }

// dependent on parent component - can either add new (parent post show container) or edit existing (parent comment tile)
  handleSubmit(event) {
    event.preventDefault()
    let formPayload = {
      body: this.state.body,
      post_id: this.state.post_id,
      user_id: this.state.user_id
    }
    this.props.addNewComment(formPayload)
    this.clearForm()
  }

  handleChange(event) {
    let name = event.target.name
    let value = event.target.value
    this.setState({ [name]: value })
  }

  render() {
    return(
      <div className="grid-x">
        <h3>
          Make a Comment
        </h3>
        <form className='small-8 cell'  onSubmit={this.handleSubmit}>
          <TextAreaField
            content={this.state.body}
            label="Comment: "
            name="body"
            handleChange={this.handleChange}
          />
        <div className='button-group'>
          <input className='button' type='submit' value='Submit Comment' />
        </div>
        </form>
      </div>
    )
  }
}

export default CommentFormContainer;
