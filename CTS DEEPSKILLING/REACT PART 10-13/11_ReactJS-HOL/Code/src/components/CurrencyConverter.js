import React, { Component } from 'react';

/**
 * CurrencyConverter component demonstrating form handling, state binding,
 * validation, and event handling in a React Class Component.
 */
class CurrencyConverter extends Component {
  constructor(props) {
    super(props);
    
    // Initialize component state
    this.state = {
      amount: '',
      currency: ''
    };

    // Bind event handlers
    this.handleInputChange = this.handleInputChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  // Generic handler for form input changes
  handleInputChange(event) {
    const { name, value } = event.target;
    this.setState({
      [name]: value
    });
  }

  // Handle form submission and currency conversion (Euro to Rupees)
  handleSubmit(event) {
    // Prevent default form submission reload
    event.preventDefault();
    
    const { amount } = this.state;

    // Validation: Check if amount is empty
    if (!amount || amount.trim() === '') {
      alert("Enter Amount");
      return;
    }

    // Validation: Check if amount is not numeric
    const amountVal = Number(amount);
    if (isNaN(amountVal)) {
      alert("Invalid Amount");
      return;
    }

    // Convert Euro to Rupees: 1 Euro = 80 Rupees
    const convertedAmount = amountVal * 80;

    // Display the converted value matching the screenshot
    alert("Converting to Euro Amount is " + convertedAmount);
  }

  render() {
    return (
      <div className="currency-converter-container">
        {/* Component Title */}
        <h2 className="converter-heading">Currency Convertor!!!</h2>
        
        {/* Form handling */}
        <form onSubmit={this.handleSubmit} className="converter-form">
          <div className="form-group">
            <label htmlFor="amount-input">Amount:</label>
            <input
              type="text"
              id="amount-input"
              name="amount"
              value={this.state.amount}
              onChange={this.handleInputChange}
              className="form-control"
            />
          </div>
          
          <div className="form-group">
            <label htmlFor="currency-textarea">Currency:</label>
            <textarea
              id="currency-textarea"
              name="currency"
              value={this.state.currency}
              onChange={this.handleInputChange}
              className="form-control"
              rows="1"
            />
          </div>
          
          <div className="form-group button-container">
            <button type="submit" id="btn-submit">
              Submit
            </button>
          </div>
        </form>
      </div>
    );
  }
}

export default CurrencyConverter;
