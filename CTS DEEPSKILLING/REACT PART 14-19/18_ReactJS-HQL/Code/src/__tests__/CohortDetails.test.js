/*
  Cohort Tracker Application - CohortDetails.test.js
  This test suite verifies the functionality of the CohortDetails component.
  It imports shallow, mount from enzyme, and renderer from react-test-renderer.
  It contains 4 tests to verify:
    1. The component is successfully created using shallow().
    2. Props are correctly initialized using mount().
    3. The cohort code is rendered in the h3 element.
    4. The output is consistent using snapshot testing.
*/

import React from 'react';
import { shallow, mount } from 'enzyme';
import renderer from 'react-test-renderer';
import CohortDetails from '../components/CohortDetails';
import { CohortData } from '../data/Cohort';

describe("Cohort Details Component", () => {
  // Test 1: Verify the component compiles/creates successfully
  test("should create the component", () => {
    const wrapper = shallow(<CohortDetails cohort={CohortData[0]} />);
    expect(wrapper.exists()).toBe(true);
  });

  // Test 2: Verify component receives and initializes props correctly
  test("should initialize the props", () => {
    const wrapper = mount(<CohortDetails cohort={CohortData[0]} />);
    expect(wrapper.props().cohort).toEqual(CohortData[0]);
    wrapper.unmount();
  });

  // Test 3: Verify that the cohortCode is displayed inside the h3 element
  test("should display cohort code in h3", () => {
    const wrapper = mount(<CohortDetails cohort={CohortData[0]} />);
    expect(wrapper.find('h3').text()).toEqual(CohortData[0].cohortCode);
    wrapper.unmount();
  });

  // Test 4: Verify that the component's HTML structure does not change unexpectedly
  test("should always render same html", () => {
    const tree = renderer.create(<CohortDetails cohort={CohortData[0]} />).toJSON();
    expect(tree).toMatchSnapshot();
  });
});
