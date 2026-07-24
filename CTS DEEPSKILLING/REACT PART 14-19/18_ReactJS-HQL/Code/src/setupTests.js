/*
  Cohort Tracker Application - setupTests.js
  This file configures the test environment for React.
  It configures Enzyme with the Adapter for React 16 and imports '@testing-library/jest-dom'.
*/

import './polyfills';
import '@testing-library/jest-dom';
import { configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

// Configure Enzyme to use the adapter for React 16
configure({ adapter: new Adapter() });
