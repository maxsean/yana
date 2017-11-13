import TextInputField from '../../../src/components/TextInputField'
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';

describe('TextInputField', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(
      <TextInputField
        id='name'
        name='name'
        type='text'
        value=''
        label='name'
      />
    )
  })
  it('should render an input with specific props', () => {
  expect(wrapper.find('input').props()).toEqual({
    id: 'name',
    name: 'name',
    type: 'text',
    value: undefined,
    style: Object({width: '100%', height: '24px'})
  });
});

  it('should render an label', () => {
    expect(wrapper.find('label').text()).toBe('name')
  })

})
