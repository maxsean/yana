import SurveyTile from '../../../src/components/SurveyTile'
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';
import { Link } from 'react-router'

describe('SurveyTile', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(
      <SurveyTile
        id={1}
        title={"test survey"}
        description={"test description"}
      />
    )
  })

  it('should have name of survey with link', () => {
    expect(wrapper.find('Link').text()).toBe(' test survey ')
  })

  it('should have description of survey', () => {
    expect(wrapper.find('div').at(2).text()).toBe( 'test description')
  })
})
