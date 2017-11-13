import TextInputField from '../../../src/components/TextInputField';
import TextAreaField from '../../../src/components/TextAreaField';
import DropMenuComponent from '../../../src/components/DropMenuComponent'
import PostFormContainer from '../../../src/containers/PostFormContainer';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';

describe('PostFormContainer', () => {
  let wrapper;

  beforeEach(() => {
    jasmineEnzyme();
    spyOn(PostFormContainer.prototype, 'handleSubmit')
    wrapper = mount(
      <PostFormContainer
        current_user={{id: 1}}
        forum_id={1}
      />
    )
  })

  it('should have the specified initial state', () => {
    expect(wrapper.state()).toEqual({
      title: "",
      body: "",
      forum_id: 1,
      user_id: 1,
      post_type: "",
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
        value: "Submit Post"
    })
  })

  it('should submit the form on click', () => {
    wrapper.find('form').props().onSubmit()
    expect(PostFormContainer.prototype.handleSubmit).toHaveBeenCalled();
    expect(wrapper.state()).toEqual({
      title: "",
      body: "",
      forum_id: 1,
      user_id: 1,
      post_type: "",
    })
  })

  it('should render fields with specific props depending on state', () => {
    wrapper.setState({
      title: "test title",
      body: "test body",
      post_type: "story"
    })

    expect(wrapper.find(TextInputField).props()).toEqual({
      content: "test title",
      label: "Title: ",
      name: "title",
      handleChange: jasmine.any(Function)
    })
    expect(wrapper.find(DropMenuComponent).props()).toEqual({
      content: "story",
      label: "Reason for Post: ",
      name: "post_type",
      handleChange: jasmine.any(Function)
    })
    expect(wrapper.find(TextAreaField).props()).toEqual({
      content: "test body",
      label: "Body: ",
      name: "body",
      handleChange: jasmine.any(Function)
    })
  })
})
