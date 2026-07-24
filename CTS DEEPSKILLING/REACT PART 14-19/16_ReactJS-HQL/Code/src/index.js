// index.js
// Importing React and ReactDOM libraries
import React from 'react';
import ReactDOM from 'react-dom/client';
// Importing root App component
import App from './App';

// Creating React root element and rendering the application
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
