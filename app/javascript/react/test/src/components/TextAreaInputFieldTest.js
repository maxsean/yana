import TextAreaField from '../../../src/components/TextAreaField'
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';

describe('TextAreaField', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(
      <TextAreaField
        id='description'
        name='description'
        type='text'
        value=''
        label='description'
        className='area'
      />
    );
  });

  it('should render a textarea with specific props', () => {
    expect(wrapper.find('textarea').props()).toEqual({
      id: 'description',
	    name: 'description',
	    type: 'text',
	    value: undefined,
      className: 'area'
    });
  });

  it('should render a label', () => {
    expect(wrapper.find('label').text()).toBe('description');
  });
});
