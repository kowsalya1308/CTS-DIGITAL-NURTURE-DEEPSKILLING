// src/components/ListofIndianPlayers.js
// Task 4: Component merging two arrays using the ES6 Spread Operator (...)

import React from 'react';

// Two separate player arrays
const T20Players = ['First Player', 'Second Player', 'Third Player'];
const RanjiPlayers = ['Fourth Player', 'Fifth Player', 'Sixth Player'];

// Merge arrays using ES6 Spread Operator
const ListofIndianPlayersMerged = [...T20Players, ...RanjiPlayers];

// Functional component ListofIndianPlayers
function ListofIndianPlayers() {
  return (
    <div>
      <ul>
        {ListofIndianPlayersMerged.map((player, index) => (
          <li key={index}>Mr. {player}</li>
        ))}
      </ul>
    </div>
  );
}

export default ListofIndianPlayers;
