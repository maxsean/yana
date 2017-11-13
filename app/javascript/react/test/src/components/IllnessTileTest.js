import IllnessTile from '../../../src/components/IllnessTile'
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';
import { Link } from 'react-router'

describe('IllnessTile', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(
      <IllnessTile
        id={1}
        name={"test illness"}
        description={"test description"}
      />
    )
  })

  it('should have name of illness with link', () => {
    expect(wrapper.find('Link').text()).toBe(' test illness ')
  })

  it('should have description of illness', () => {
    expect(wrapper.find('div').at(2).text()).toBe( 'test description')
  })
})
