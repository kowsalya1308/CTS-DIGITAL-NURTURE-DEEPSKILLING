import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import './App.css';

/**
 * Entry point of the React application.
 * Uses ReactDOM.createRoot() to mount the application to the DOM at the element with ID 'root'.
 * Renders the top-level App component inside React.StrictMode.
 */
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
