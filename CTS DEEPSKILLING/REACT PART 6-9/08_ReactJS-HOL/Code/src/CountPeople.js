import React, { Component } from 'react';

/**
 * CountPeople Class Component
 * Manages entry and exit counts for the Shopping Mall Counter application.
 */
class CountPeople extends Component {
  /**
   * Constructor initializes the state with entrycount and exitcount set to 0.
   * @param {Object} props - Properties passed to the component.
   */
  constructor(props) {
    super(props);

    // Requirement 3: Initialize the state with entrycount: 0 and exitcount: 0
    this.state = {
      entrycount: 0,
      exitcount: 0
    };
  }

  /**
   * Requirement 4: updateEntry()
   * Increments entrycount by 1 using setState() and the previous state.
   */
  updateEntry = () => {
    this.setState((prevState) => ({
      entrycount: prevState.entrycount + 1
    }));
  };

  /**
   * Requirement 4: updateExit()
   * Increments exitcount by 1 using setState() and the previous state.
   */
  updateExit = () => {
    this.setState((prevState) => ({
      exitcount: prevState.exitcount + 1
    }));
  };

  /**
   * Requirement 5 & 6: Render UI containing Heading, Login and Exit buttons, and counter displays.
   */
  render() {
    return (
      <div className="counter-container">
        {/* Heading: Shopping Mall Counter */}
        <h1>Shopping Mall Counter</h1>

        {/* Counter section wrapper */}
        <div className="counter-wrapper">
          {/* Login / Entry counter row */}
          <div className="counter-item">
            <button className="btn-login" onClick={this.updateEntry}>
              Login
            </button>
            <span className="count-text">
              {this.state.entrycount} People Entered!!
            </span>
          </div>

          {/* Exit counter row */}
          <div className="counter-item">
            <button className="btn-exit" onClick={this.updateExit}>
              Exit
            </button>
            <span className="count-text">
              {this.state.exitcount} People Left!!
            </span>
          </div>
        </div>
      </div>
    );
  }
}

export default CountPeople;
