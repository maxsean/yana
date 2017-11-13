import CommentTile from '../../../src/components/CommentTile'
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';

describe('CommentTile', () => {
  let wrapper;

  beforeEach(() => {
    spyOn(CommentTile.prototype, 'handleEditClick').and.callThrough()
    wrapper = mount(
      <CommentTile
        id={1}
        body={"test body"}
        user={{id: 1, handle: "test user"}}
        created_at={"Fri, 10 Nov 2017 18:43:05 UTC +00:00"}
        post_id={1}
        current_user={{id: 1}}
      />
    )
  })

  it('should have body of the comment', () => {
    expect(wrapper.find('p').text()).toBe('test body')
  })

  it('should have user and date of creation', () => {
    expect(wrapper.find('div').at(2).text()).toBe( 'Made by test user on  Nov 12 2017EditDelete')
  })

  it('should have buttons to modify comment', () => {
    expect(wrapper.find('button')).toBePresent()
  })

  it('should have an edit button that toggles state', () => {
    wrapper.find('button').at(0).simulate('click')
    expect(CommentTile.prototype.handleEditClick).toHaveBeenCalled();
    expect(wrapper.state()).toEqual({
      edit: true,
      comment: undefined
    })
  })
})
