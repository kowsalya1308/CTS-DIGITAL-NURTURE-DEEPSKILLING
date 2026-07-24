// Register.js
// Importing React and Component from the React library
import React, { Component } from 'react';

// Class component for the Registration Form
class Register extends Component {
  // Constructor to initialize state and bind event handlers
  constructor(props) {
    super(props);
    
    // State maintaining form field values and validation errors
    this.state = {
      fullName: "",
      email: "",
      password: "",
      errors: {
        fullName: "",
        email: "",
        password: ""
      }
    };
  }

  // Function to validate the entire form on submission
  validateForm = () => {
    const { fullName, email, password } = this.state;
    let errors = {
      fullName: "",
      email: "",
      password: ""
    };
    let isFormValid = true;

    // Name field validation: must contain at least 5 characters
    if (fullName.length < 5) {
      errors.fullName = "Full Name must be 5 characters long";
      isFormValid = false;
    }

    // Email field validation: must contain @ and . using regular expression
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      errors.email = "Email is not valid";
      isFormValid = false;
    }

    // Password field validation: must be at least 8 characters
    if (password.length < 8) {
      errors.password = "Password must be 8 characters long";
      isFormValid = false;
    }

    // Updating the errors state
    this.setState({ errors });

    return isFormValid;
  }

  // Event handler for input changes to support controlled components and validation while typing
  handleChange = (event) => {
    const { name, value } = event.target;

    // Update the corresponding state field
    this.setState({
      [name]: value
    }, () => {
      // Validate fields while typing
      let errors = { ...this.state.errors };
      
      if (name === "fullName") {
        errors.fullName = this.state.fullName.length < 5 
          ? "Full Name must be 5 characters long" 
          : "";
      } else if (name === "email") {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        errors.email = emailRegex.test(this.state.email) 
          ? "" 
          : "Email is not valid";
      } else if (name === "password") {
        errors.password = this.state.password.length < 8 
          ? "Password must be 8 characters long" 
          : "";
      }

      this.setState({ errors });
    });
  }

  // Event handler for form submission
  handleSubmit = (event) => {
    // Prevent the default browser form submission behavior
    event.preventDefault();

    // Validate the form and handle the alert notifications
    if (this.validateForm()) {
      alert("Valid Form");
      alert("Registration Successful");
      
      // Clear the form after successful registration
      this.setState({
        fullName: "",
        email: "",
        password: "",
        errors: {
          fullName: "",
          email: "",
          password: ""
        }
      });
    } else {
      // Display the corresponding validation message using alert() in order of precedence: Name -> Email -> Password
      const { fullName, email, password } = this.state;
      
      if (fullName.length < 5) {
        alert("Full Name must be 5 characters long");
      } else {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
          alert("Email is not valid");
        } else if (password.length < 8) {
          alert("Password must be 8 characters long");
        }
      }
    }
  }

  // Render method to output the component UI
  render() {
    const { fullName, email, password } = this.state;

    return (
      <div className="register-container">
        {/* Heading display */}
        <h2>Register Here!!!</h2>
        
        {/* Registration Form */}
        <form className="register-form" onSubmit={this.handleSubmit} noValidate>
          {/* Name field group */}
          <div className="form-group">
            <label htmlFor="fullName">Name:</label>
            <input
              type="text"
              id="fullName"
              name="fullName"
              value={fullName}
              onChange={this.handleChange}
            />
          </div>

          {/* Email field group */}
          <div className="form-group">
            <label htmlFor="email">Email:</label>
            <input
              type="text"
              id="email"
              name="email"
              value={email}
              onChange={this.handleChange}
            />
          </div>

          {/* Password field group */}
          <div className="form-group">
            <label htmlFor="password">Password:</label>
            <input
              type="password"
              id="password"
              name="password"
              value={password}
              onChange={this.handleChange}
            />
          </div>

          {/* Submit Button */}
          <div className="button-container">
            <button type="submit" className="submit-btn">
              Submit
            </button>
          </div>
        </form>
      </div>
    );
  }
}

export default Register;
