import React, { Component } from 'react';
import OnlineShopping from './OnlineShopping';
import './App.css';

/**
 * App Class Component
 * 
 * Main root class component that renders the OnlineShopping component.
 */
class App extends Component {
  render() {
    return (
      <div className="App">
        <OnlineShopping />
      </div>
    );
  }
}

export default App;
