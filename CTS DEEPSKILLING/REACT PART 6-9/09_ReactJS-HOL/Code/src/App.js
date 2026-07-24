// src/App.js
// Main application component implementing conditional rendering using ES6 / JS if...else statement

import React from 'react';
import './App.css';
import ListofPlayers from './components/ListofPlayers';
import ScoreBelow70 from './components/ScoreBelow70';
import IndianPlayers from './components/IndianPlayers';
import ListofIndianPlayers from './components/ListofIndianPlayers';

function App() {
  // Flag variable for conditional rendering as per Task 5 requirements
  var flag = true;

  // Simple if...else statement to render two components based on flag
  if (flag === true) {
    return (
      <div>
        <h1>List of Players</h1>
        <ListofPlayers />
        <hr />
        <h1>List of Players having Scores Less than 70</h1>
        <ScoreBelow70 />
      </div>
    );
  } else {
    return (
      <div>
        <IndianPlayers />
        <hr />
        <h1>List of Indian Players Merged:</h1>
        <ListofIndianPlayers />
      </div>
    );
  }
}

export default App;
