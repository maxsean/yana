import QuestionTile from '../../../src/components/QuestionTile'
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';
import { Link } from 'react-router'

describe('QuestionTile', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(
      <QuestionTile
        id={1}
        label={"test question"}
        choices={[{id: 1, body: "test choice"}]}
        checked={false}
      />
    )
  })

  it('should have body of question', () => {
    expect(wrapper.find('div').at(0).text()).toBe(' test question test choice ')
  })

})
