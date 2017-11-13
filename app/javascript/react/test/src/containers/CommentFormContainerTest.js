import TextAreaField from '../../../src/components/TextAreaField';
import CommentFormContainer from '../../../src/containers/CommentFormContainer';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';

describe('CommentFormContainer', () => {
  let wrapper;

  beforeEach(() => {
    jasmineEnzyme();
    spyOn(CommentFormContainer.prototype, 'handleSubmit')
    wrapper = mount(
      <CommentFormContainer
        current_user={{id: 1}}
        post_id={1}
      />
    )
  })

  it('should have the specified initial state', () => {
    expect(wrapper.state()).toEqual({
      body: "",
      post_id: 1,
      user_id: 1,
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
        value: "Submit Comment"
    })
  })

  it('should submit the form on click', () => {
    wrapper.find('form').props().onSubmit()
    expect(CommentFormContainer.prototype.handleSubmit).toHaveBeenCalled();
    expect(wrapper.state()).toEqual({
      body: "",
      post_id: 1,
      user_id: 1,
    })
  })

  it('should render fields with specific props depending on state', () => {
    wrapper.setState({
      body: "test body",
    })
    expect(wrapper.find(TextAreaField).props()).toEqual({
      content: "test body",
      label: "Comment: ",
      name: "body",
      handleChange: jasmine.any(Function)
    })
  })
})
