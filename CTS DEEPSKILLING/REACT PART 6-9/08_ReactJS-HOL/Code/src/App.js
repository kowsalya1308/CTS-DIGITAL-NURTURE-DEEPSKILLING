import React, { Component } from 'react';
import CountPeople from './CountPeople';

/**
 * App Class Component
 * Requirement 9: App.js renders only the CountPeople component.
 */
class App extends Component {
  render() {
    return (
      <div className="App">
        {/* Render the CountPeople class component */}
        <CountPeople />
      </div>
    );
  }
}

export default App;
