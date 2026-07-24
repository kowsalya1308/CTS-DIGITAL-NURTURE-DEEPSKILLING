/*
  Cohort Tracker Application - App.js
  This is the main root component of the Cohort Tracker application.
  It renders the application shell, including the centered page heading
  "Cohort Tracker Dashboard" and maps over `CohortData` to render individual
  `CohortDetails` cards inside a responsive grid layout.
*/

import React from 'react';
import { CohortData } from './data/Cohort';
import CohortDetails from './components/CohortDetails';

function App() {
  return (
    <div className="app-container">
      {/* Centered Dashboard Heading */}
      <header className="app-header">
        <h1 className="dashboard-title">Cohort Tracker Dashboard</h1>
      </header>

      {/* Grid container for Cohort Details Cards */}
      <main className="dashboard-grid">
        {CohortData.map((cohort) => (
          <CohortDetails key={cohort.id} cohort={cohort} />
        ))}
      </main>
    </div>
  );
}

export default App;
