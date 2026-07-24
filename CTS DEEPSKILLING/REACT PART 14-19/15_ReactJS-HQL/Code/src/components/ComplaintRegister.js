/**
 * src/components/ComplaintRegister.js
 * 
 * Class component representing the Complaint Registration form.
 * It manages form state using a constructor, binds event handlers,
 * implements dynamic state updates for controlled inputs,
 * handles submissions by raising an alert, and resets fields post-submit.
 */

import React, { Component } from 'react';

class ComplaintRegister extends Component {
  constructor(props) {
    super(props);
    
    // Task 2: Initialize the state with required variables
    this.state = {
      ename: '',
      complaint: ''
    };

    // Bind handlers to ensure proper 'this' context inside methods
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  /**
   * Task 4: Dynamic input change handler
   * Sets state properties dynamically based on the input name attribute.
   * 
   * @param {Object} event - The HTML input change event object
   */
  handleChange(event) {
    this.setState({
      [event.target.name]: event.target.value
    });
  }

  /**
   * Task 5 & 6: Form submission handler
   * Prevents browser default behavior, generates reference ID,
   * alerts the user, and clears the state.
   * 
   * @param {Object} event - The form submit event object
   */
  handleSubmit(event) {
    // Prevent default page reload on submit
    event.preventDefault();

    // Generate random reference ID: Math.floor(Math.random()*100000)
    const referenceNum = Math.floor(Math.random() * 100000);

    // Display the success alert with the employee name and reference ID
    alert("Thanks " + this.state.ename + "\nYour Complaint was Submitted.\nReference ID : " + referenceNum);

    // Clear form inputs by resetting state
    this.setState({
      ename: '',
      complaint: ''
    });
  }

  render() {
    return (
      <div className="complaint-container">
        {/* Task 7: Red centered heading */}
        <h1 className="main-heading">Register your complaints here!!!</h1>

        {/* Task 3 & 8: Form layout with labels, textbox, textarea and submit button */}
        <form className="complaint-form" onSubmit={this.handleSubmit}>
          <div className="form-group">
            <label htmlFor="ename">Name:</label>
            <input
              type="text"
              id="ename"
              name="ename"
              value={this.state.ename}
              onChange={this.handleChange}
              required
            />
          </div>

          <div className="form-group">
            <label htmlFor="complaint">Complaint:</label>
            <textarea
              id="complaint"
              name="complaint"
              value={this.state.complaint}
              onChange={this.handleChange}
              required
            />
          </div>

          <div className="button-group">
            <button type="submit" className="submit-btn">Submit</button>
          </div>
        </form>
      </div>
    );
  }
}

export default ComplaintRegister;
