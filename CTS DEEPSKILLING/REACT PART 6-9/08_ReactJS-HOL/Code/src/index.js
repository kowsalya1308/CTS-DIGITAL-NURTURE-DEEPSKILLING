import React from 'react';
import ReactDOM from 'react-dom/client';
import './App.css';
import App from './App';

/**
 * Requirement 10: index.js renders App component using ReactDOM.createRoot().
 */
const root = ReactDOM.createRoot(document.getElementById('root'));

root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
