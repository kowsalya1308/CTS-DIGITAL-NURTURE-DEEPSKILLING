/**
 * src/App.js
 * 
 * Main root component of the React application.
 * This component imports and renders only the ComplaintRegister component
 * and loads the global stylesheets from App.css.
 */

import React from 'react';
import './App.css';
import ComplaintRegister from './components/ComplaintRegister';

function App() {
  return (
    // Render only the ComplaintRegister component as per requirements
    <ComplaintRegister />
  );
}

export default App;
