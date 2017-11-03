import React from 'react';
import TextInputField from '../components/TextInputField';
import TextAreaField from '../components/TextAreaField';

class PostFormContainer extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      title: "",
      body: "",
      forum_id: this.props.forum_id,
      user_id: this.props.current_user.id,
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
      title: "",
      body: "",
    })
  }

  handleSubmit(event) {
    event.preventDefault()
    let formPayload = {
      title: this.state.title,
      body: this.state.body,
      forum_id: this.state.forum_id,
      user_id: this.state.user_id
    }
    this.props.addNewPost(formPayload)
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
          Make a Post
        </h3>
        <form className='small-8 cell'  onSubmit={this.handleSubmit}>
          <TextInputField
            content={this.state.title}
            label="Title: "
            name="title"
            handleChange={this.handleChange}
          />
          <TextAreaField
            content={this.state.comment}
            label="Body: "
            name="body"
            handleChange={this.handleChange}
          />
        <div className='button-group'>
          <input className='button' type='submit' value='Submit Post' />
        </div>
        </form>
      </div>
    )
  }
}

export default PostFormContainer;
