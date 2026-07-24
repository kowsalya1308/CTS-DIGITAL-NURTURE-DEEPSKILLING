// src/components/ScoreBelow70.js
// Task 2: Component to display players with scores <= 70 using ES6 arrow function and filter()

import React from 'react';
import { players } from './ListofPlayers';

// Functional component to filter and display players with score <= 70
function ScoreBelow70() {
  // Arrow function used with filter() to extract players scoring <= 70
  const lowScorers = players.filter((player) => player.score <= 70);

  return (
    <div>
      <ul>
        {lowScorers.map((player, index) => (
          <li key={index}>
            Mr. {player.name} {player.score}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default ScoreBelow70;
