import React, { useState } from 'react';
import ThemeContext from './ThemeContext';
import EmployeeList from './components/EmployeeList';
import employeesData from './data/employees';
import './App.css';

/**
 * App Component
 * Serves as the root functional component of the application.
 * Manages the current theme ('light' or 'dark') using the useState hook.
 * Wraps the child tree inside ThemeContext.Provider to share theme data without prop drilling.
 * Renders a 'Toggle Theme' button and the EmployeeList component.
 */
function App() {
  // Theme state: 'light' is default
  const [theme, setTheme] = useState('light');

  // Toggles theme state between 'light' and 'dark'
  const toggleTheme = () => {
    setTheme((prevTheme) => (prevTheme === 'light' ? 'dark' : 'light'));
  };

  return (
    <ThemeContext.Provider value={theme}>
      <div className={`app-container ${theme}`}>
        <header className="app-header">
          <h1>Employee Directory</h1>
          <button className="toggle-btn" onClick={toggleTheme}>
            Toggle Theme
          </button>
        </header>
        <main>
          {/* Render EmployeeList component, passing only the employees data array as a prop */}
          <EmployeeList employees={employeesData} />
        </main>
      </div>
    </ThemeContext.Provider>
  );
}

export default App;
