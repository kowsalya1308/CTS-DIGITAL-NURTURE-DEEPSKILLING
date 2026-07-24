import React, { useContext } from 'react';
import ThemeContext from '../ThemeContext';

/**
 * EmployeeCard Component
 * Displays individual employee fields: Name, Designation, Department, Salary, and Email.
 * Also provides Edit and Delete action buttons.
 * Consumes ThemeContext directly to avoid prop drilling and applies theme CSS classes.
 */
function EmployeeCard({ employee }) {
  // Consume the theme state from ThemeContext
  const theme = useContext(ThemeContext);

  const { name, designation, department, salary, email } = employee;

  return (
    <div className={`employee-card ${theme}`}>
      <h3 className="employee-name">{name}</h3>
      <p className="employee-detail">
        <strong>Designation:</strong> {designation}
      </p>
      <p className="employee-detail">
        <strong>Department:</strong> {department}
      </p>
      <p className="employee-detail">
        <strong>Salary:</strong> ${salary.toLocaleString()}
      </p>
      <p className="employee-detail">
        <strong>Email:</strong> {email}
      </p>
      <div className="card-actions">
        <button className="action-btn edit-btn">Edit</button>
        <button className="action-btn delete-btn">Delete</button>
      </div>
    </div>
  );
}

export default EmployeeCard;
