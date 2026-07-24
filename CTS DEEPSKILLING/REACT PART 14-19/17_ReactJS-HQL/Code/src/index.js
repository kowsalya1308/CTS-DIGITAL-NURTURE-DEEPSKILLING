// index.js: Entry point of the React application.
// This file initializes the React application by mounting the main App component
// to the 'root' DOM element in public/index.html using ReactDOM.createRoot().

import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';

// Retrieve the root DOM element from index.html
const rootElement = document.getElementById('root');

// Create the React root container
const root = ReactDOM.createRoot(rootElement);

// Render the main App component
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
