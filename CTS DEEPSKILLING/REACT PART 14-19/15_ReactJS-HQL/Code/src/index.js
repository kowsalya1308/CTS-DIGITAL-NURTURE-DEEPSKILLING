/**
 * src/index.js
 * 
 * Entry point of the React application.
 * This file is responsible for selecting the root HTML element,
 * initializing the React application root using ReactDOM.createRoot(),
 * and rendering the root App component within it.
 */

import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';

// Select the root DOM element from public/index.html
const rootElement = document.getElementById('root');

// Create the React root using the new React 18 createRoot API
const root = ReactDOM.createRoot(rootElement);

// Render the main App component into the root
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
