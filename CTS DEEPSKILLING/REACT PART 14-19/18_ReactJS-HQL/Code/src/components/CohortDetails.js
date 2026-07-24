/*
  Cohort Tracker Application - CohortDetails.js
  This functional component displays the details of a single cohort inside a card layout.
  It receives the `cohort` object as a prop and renders:
    - h3: Cohort Code (exact match required by unit tests)
    - Technology
    - Trainer
    - Status (with dynamic color badge: Green for Completed, Orange for Ongoing)
    - Start Date
    - End Date
*/

import React from 'react';

const CohortDetails = ({ cohort }) => {
  // If cohort prop is not passed, render nothing
  if (!cohort) {
    return null;
  }

  // Determine the status styling badge class based on the cohort's status
  const statusClass = cohort.status === 'Completed' ? 'status-completed' : 'status-ongoing';

  return (
    <div className="cohort-card">
      <div className="card-header">
        {/* Unit tests expect the h3 content to match cohortCode exactly */}
        <h3>{cohort.cohortCode}</h3>
      </div>
      <div className="card-body">
        <p className="card-info">
          <span className="info-label">Technology:</span> {cohort.technology}
        </p>
        <p className="card-info">
          <span className="info-label">Trainer:</span> {cohort.trainer}
        </p>
        <p className="card-info">
          <span className="info-label">Status:</span>{' '}
          <span className={`status-badge ${statusClass}`}>
            {cohort.status}
          </span>
        </p>
        <p className="card-info">
          <span className="info-label">Start Date:</span> {cohort.startDate}
        </p>
        <p className="card-info">
          <span className="info-label">End Date:</span> {cohort.endDate}
        </p>
      </div>
    </div>
  );
};

export default CohortDetails;
