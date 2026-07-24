import React, { Component } from 'react';
import './App.css';
import EventExamples from './components/EventExamples';
import CurrencyConverter from './components/CurrencyConverter';

/**
 * Root App component rendered as a Class Component.
 * It renders the EventExamples and CurrencyConverter components.
 */
class App extends Component {
  render() {
    return (
      <div className="App">
        <EventExamples />
        <CurrencyConverter />
      </div>
    );
  }
}

export default App;
