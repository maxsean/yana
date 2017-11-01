import TextInputField from '../../../src/components/TextInputField';
import SignUpFormContainer from '../../../src/containers/SignUpFormContainer';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';


describe('SignUpFormContainer', () => {
  let wrapper;

  beforeEach(() => {
    jasmineEnzyme();
    spyOn(SignUpFormContainer.prototype, 'handleSubmit')
    wrapper = mount(
      <SignUpFormContainer />
    )
  })

  it('should have the specified initial state', () => {
    expect(wrapper.state()).toEqual({
      handle: "",
      email: "",
      password: "",
      password_confirmation: "",
      errors: {}
    })
  })

  it('renders a form', () => {
    expect(wrapper.find('form')).toBePresent();
  });

  it('renders a button with the value of "Submit"', () => {
    expect(wrapper.find('input')).toBePresent();
    expect(wrapper.find('input.button').props()).toEqual({
        className: "button",
        type: "submit",
        value: "Submit"
    })
  })

  it('should submit the form on click', () => {
    wrapper.find('form').props().onSubmit()
    expect(SignUpFormContainer.prototype.handleSubmit).toHaveBeenCalled();
    expect(wrapper.state()).toEqual({
      handle: "",
      email: "",
      password: "",
      password_confirmation: "",
      errors: {}
    })
  })

  it('should render text input field with specific props depending on state', () => {
    wrapper.setState({
      handle: "testuser",
      email: "test@user.com",
      password: "123456",
      password_confirmation: "123456",
      errors: {}
    })
    expect(wrapper.find(TextInputField).at(0).props()).toEqual({
      content: "testuser",
      label: "Username: ",
      name: "handle",
      handleChange: jasmine.any(Function),
    })
    expect(wrapper.find(TextInputField).at(1).props()).toEqual({
      content: "test@user.com",
      label: "Email: ",
      name: "email",
      handleChange: jasmine.any(Function),
    })
    expect(wrapper.find(TextInputField).at(2).props()).toEqual({
      content: "123456",
      label: "Password: ",
      name: "password",
      handleChange: jasmine.any(Function),
    })
    expect(wrapper.find(TextInputField).at(3).props()).toEqual({
      content: "123456",
      label: "Confirmation: ",
      name: "password_confirmation",
      handleChange: jasmine.any(Function),
    })
  })
})
