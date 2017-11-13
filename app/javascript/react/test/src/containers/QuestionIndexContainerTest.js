import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';
import QuestionIndexContainer from '../../../src/containers/QuestionIndexContainer'
import QuestionTile from '../../../src/components/QuestionTile'

describe('QuestionIndexContainer', () => {
  let example,
      wrapper;
  beforeEach(() => {
    const example = [
      {
        id: 1,
        body: "test question",
        short: "test",
        choices: [
          {
            id: 1,
            body: "test choice",
            short: "test"
          }
        ]
      }
    ];
    wrapper = mount(
      <QuestionIndexContainer
        questions={example}
        current_user={{id: 1}}
      />
    )
  })

  it('renders QuestionTile component when a forum exists', () => {
    expect(wrapper.find('QuestionTile')).toBePresent()
  })

  it('a QuestionTile component should have specified props', () => {
    expect(wrapper.find('QuestionTile').props()).toEqual({
      id: 1,
      label: "test question",
      choices: [
        {
          id: 1,
          body: "test choice",
          short: "test"
        }
      ],
      handleChange: jasmine.any(Function),
      checked: jasmine.any(Object)
    })
  })
})
