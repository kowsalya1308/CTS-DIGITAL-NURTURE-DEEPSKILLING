import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';

/**
 * Application Entry Point
 * 
 * Uses React 18 createRoot API to render the App class component into the 'root' DOM node.
 */
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
