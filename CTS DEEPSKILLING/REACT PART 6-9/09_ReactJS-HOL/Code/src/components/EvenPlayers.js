// src/components/EvenPlayers.js
// Task 3: Component to display even position players using ES6 Destructuring

import React from 'react';
import { IndianTeam } from './IndianPlayers';

// Functional component EvenPlayers
function EvenPlayers() {
  // Using ES6 Destructuring to extract even position players (2nd, 4th, 6th)
  const [, second, , fourth, , sixth] = IndianTeam;

  return (
    <div>
      <ul>
        <li>Second : {second}</li>
        <li>Fourth : {fourth}</li>
        <li>Sixth : {sixth}</li>
      </ul>
    </div>
  );
}

export default EvenPlayers;
