// src/components/OddPlayers.js
// Task 3: Component to display odd position players using ES6 Destructuring

import React from 'react';
import { IndianTeam } from './IndianPlayers';

// Functional component OddPlayers
function OddPlayers() {
  // Using ES6 Destructuring to extract odd position players (1st, 3rd, 5th)
  const [first, , third, , fifth] = IndianTeam;

  return (
    <div>
      <ul>
        <li>First : {first}</li>
        <li>Third : {third}</li>
        <li>Fifth : {fifth}</li>
      </ul>
    </div>
  );
}

export default OddPlayers;
