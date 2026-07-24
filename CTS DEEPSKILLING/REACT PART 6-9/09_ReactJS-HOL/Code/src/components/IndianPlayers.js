// src/components/IndianPlayers.js
// Task 3: Array storage and component displaying Odd and Even Indian players

import React from 'react';
import OddPlayers from './OddPlayers';
import EvenPlayers from './EvenPlayers';

// Array storing 6 Indian team players
export const IndianTeam = [
  'Sachin1',
  'Dhoni2',
  'Virat3',
  'Rohit4',
  'Yuvraj5',
  'Raina6'
];

// IndianPlayers component rendering OddPlayers and EvenPlayers
function IndianPlayers() {
  return (
    <div>
      <h1>Odd Players</h1>
      <OddPlayers />
      <hr />
      <h1>Even Players</h1>
      <EvenPlayers />
    </div>
  );
}

export default IndianPlayers;
