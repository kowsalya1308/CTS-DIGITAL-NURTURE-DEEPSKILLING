// src/index.js
// Entry point for the cricketapp React application

import React from 'react';
import ReactDOM from 'react-dom/client';
import './App.css';
import App from './App';

// Create root element and render App component
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
