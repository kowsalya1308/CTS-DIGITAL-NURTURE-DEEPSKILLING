import React from 'react';
import EmployeeCard from './EmployeeCard';

/**
 * EmployeeList Component
 * Receives an array of employees through props.
 * Maps over the collection to render an EmployeeCard for each individual.
 * Does not receive or pass the theme prop.
 */
function EmployeeList({ employees }) {
  return (
    <div className="employee-list">
      {employees.map((employee) => (
        <EmployeeCard key={employee.id} employee={employee} />
      ))}
    </div>
  );
}

export default EmployeeList;
