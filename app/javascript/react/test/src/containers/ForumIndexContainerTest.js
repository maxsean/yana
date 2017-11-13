import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';
import ForumIndexContainer from '../../../src/containers/ForumIndexContainer'
import ForumTile from '../../../src/components/ForumTile'

describe('ForumIndexContainer', () => {
  let example,
      wrapper;
  beforeEach(() => {
    const example = [
      {
        id: 1,
        name: "test forum",
        description: "test description"
      }
    ];
    wrapper = mount(
      <ForumIndexContainer
        forums={example}
      />
    )
  })

  it('renders ForumTile component when a forum exists', () => {
    expect(wrapper.find('ForumTile')).toBePresent()
  })

  it('a ForumTile component should have specified props', () => {
    expect(wrapper.find('ForumTile').props()).toEqual({
      id: 1,
      name: "test forum",
      description: "test description"
    })
  })
})
