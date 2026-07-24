// App.js: Main application component.
// This class component renders the GetUser component which handles the fetching
// and displaying of user details. It also imports App.css for styling.

import React from 'react';
import './App.css';
import GetUser from './components/GetUser';

// App component defined as a React Class Component
class App extends React.Component {
  render() {
    return (
      <div className="App">
        <GetUser />
      </div>
    );
  }
}

export default App;
