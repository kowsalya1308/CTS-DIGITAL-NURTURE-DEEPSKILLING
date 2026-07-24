/*
  Cohort Tracker Application - index.js
  This is the main entry point of the React application.
  It mounts the root App component to the DOM under the element with id 'root'.
*/

import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import './App.css'; // Import the global styles for the application

// Render the application inside the StrictMode component for catching potential problems.
ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);
