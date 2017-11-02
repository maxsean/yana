import React, {Component} from 'react';
import TextInputField from '../components/TextInputField';
import FormErrors from '../components/FormErrors';

class SignUpFormContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      handle: "",
      email: "",
      password: "",
      password_confirmation: "",
      errors: {}
    }
    this.addNewUser = this.addNewUser.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleChange = this.handleChange.bind(this)
    this.clearForm = this.clearForm.bind(this)
  }

  clearForm() {
    this.setState({
      username: "",
      email: "",
      password: "",
      password_confirmation: ""
    })
  }

  addNewUser(formPayLoad) {
    fetch('/api/v1/users', {
      credentials: 'same-origin',
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(formPayLoad)
    })
    .then(response => { return response.json() })
    .then(data => {
      if (data.error) {
        this.setState({ errors: data.error })
      } else {
        this.setState({ errors: {} })
      }
    })
  }

  handleSubmit(event) {
    event.preventDefault()
    let formPayLoad = {
      handle: this.state.handle,
      email: this.state.email,
      password: this.state.password,
      password_confirmation: this.state.password_confirmation
  }
    this.addNewUser(formPayLoad)
    this.clearForm()
  }

  handleChange(event) {
    let name = event.target.name
    let value = event.target.value
    this.setState({ [name]: value })
  }

  render() {
    let errors;
    if(this.state.errors != {}){
      errors = <FormErrors formErrors={this.state.errors}/>
    }
    return(
      <div className="signUpFormContainer">
        {errors}
        <form
<<<<<<< HEAD
          className="signUpForm"
=======
          className="callout"
>>>>>>> master
          onSubmit={this.handleSubmit}>
          <TextInputField
            content={this.state.handle}
            label="Username: "
            name="handle"
            handleChange={this.handleChange}
          />
          <TextInputField
            content={this.state.email}
            label="Email: "
            name="email"
            handleChange={this.handleChange}
          />
          <TextInputField
            content={this.state.password}
            label="Password: "
            name="password"
            handleChange={this.handleChange}
          />
          <TextInputField
            content={this.state.password_confirmation}
            label="Confirmation: "
            name="password_confirmation"
            handleChange={this.handleChange}
          />
          <div className='button-group'>
              <input className='button' type='submit' value='Submit' />
          </div>
        </form>
      </div>
    )
  }
}

export default SignUpFormContainer;
