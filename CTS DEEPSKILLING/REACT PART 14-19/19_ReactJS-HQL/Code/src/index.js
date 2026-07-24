/**
 * index.js
 * Entry point for the React application. Renders the main App component inside the DOM.
 */
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import './App.css';

// Create a root container and render the App component inside it.
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
