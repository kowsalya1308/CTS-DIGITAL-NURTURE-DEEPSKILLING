import React, { Component } from 'react';

/**
 * EventExamples component demonstrating event handling in React Class Components.
 * This includes:
 * - State initialization and management
 * - Multiple event handlers (two methods from a single event)
 * - Passing arguments to event handlers
 * - Handling Synthetic Events
 */
class EventExamples extends Component {
  constructor(props) {
    super(props);
    
    // Initialize the state
    this.state = {
      counter: 0
    };

    // Bind event handlers
    this.increment = this.increment.bind(this);
    this.alertMember = this.alertMember.bind(this);
    this.handleIncrement = this.handleIncrement.bind(this);
    this.handleDecrement = this.handleDecrement.bind(this);
    this.handleSayWelcome = this.handleSayWelcome.bind(this);
    this.handleSyntheticEvent = this.handleSyntheticEvent.bind(this);
  }

  // Method 1: Increment the counter by 1
  increment() {
    this.setState(prevState => ({
      counter: prevState.counter + 1
    }));
  }

  // Method 2: Display an alert
  alertMember() {
    alert("Hello! Member1");
  }

  // Handle Increment click: Calls both increment and alertMember
  handleIncrement() {
    this.increment();
    this.alertMember();
  }

  // Handle Decrement click: Decrease the counter by 1
  handleDecrement() {
    this.setState(prevState => ({
      counter: prevState.counter - 1
    }));
  }

  // Function that receives a message and displays it in an alert
  handleSayWelcome(message) {
    alert(message);
  }

  // Handle Synthetic Event
  handleSyntheticEvent(event) {
    // React synthetic event wrapper is available here if needed
    alert("I was clicked");
  }

  render() {
    return (
      <div className="event-examples-container">
        {/* Render current counter value */}
        <div className="counter-display">
          {this.state.counter}
        </div>

        {/* Buttons for event examples */}
        <div className="button-group">
          <button 
            id="btn-increment" 
            onClick={this.handleIncrement}
          >
            Increment
          </button>
          
          <button 
            id="btn-decrement" 
            onClick={this.handleDecrement}
          >
            Decrement
          </button>
          
          {/* Passing "Welcome" as an argument to the handler */}
          <button 
            id="btn-say-welcome" 
            onClick={() => this.handleSayWelcome("Welcome")}
          >
            Say welcome
          </button>
          
          {/* Passing the Synthetic Event directly */}
          <button 
            id="btn-click-me" 
            onClick={this.handleSyntheticEvent}
          >
            Click on me
          </button>
        </div>
      </div>
    );
  }
}

export default EventExamples;
