// App.js
// Importing React
import React from 'react';
// Importing global CSS styles
import './App.css';
// Importing Register component
import Register from './components/Register';

// Root App component rendering the Register component
function App() {
  return (
    <div className="App">
      <Register />
    </div>
  );
}

export default App;
