/**
 * App.js
 * 
 * Main application component. Contains implementation of Task 1 to Task 7.
 * Satisfies the React Hands-on requirements using functional components and ES6 syntax.
 */

import React from 'react';
import './App.css';

// Import images for JSX rendering
import officeImage from './images/office1.jpg';
import office1 from './images/office1.jpg';
import office2 from './images/office2.jpg';
import office3 from './images/office3.jpg';

function App() {
  // Task 3: Create an object named office with properties name, rent, and address
  const office = {
    name: "DBS",
    rent: 50000,
    address: "Chennai"
  };

  // Task 4: Create an array named officeSpaces with 5 office objects
  const officeSpaces = [
    {
      id: 1,
      name: "Sky Tower",
      rent: 55000,
      address: "Bangalore",
      image: office1
    },
    {
      id: 2,
      name: "Green Tech Park",
      rent: 72000,
      address: "Chennai",
      image: office2
    },
    {
      id: 3,
      name: "Cyber Plaza",
      rent: 48000,
      address: "Hyderabad",
      image: office3
    },
    {
      id: 4,
      name: "IT Hub",
      rent: 65000,
      address: "Pune",
      image: office1
    },
    {
      id: 5,
      name: "Business Square",
      rent: 58000,
      address: "Mumbai",
      image: office2
    }
  ];

  return (
    <div className="container">
      {/* Task 1: Heading at the top of the page, centered */}
      <h1 className="main-heading">Office Space Rental Application</h1>

      {/* Task 2 & Task 3: Display single office details using JSX expressions */}
      <div className="single-office-container">
        <h2 className="section-heading">Office Space , at Affordable Range</h2>
        
        {/* Task 2: Display office image using JSX */}
        <div className="single-office-image-wrapper">
          <img src={officeImage} alt="Office Space" className="single-office-img" />
        </div>

        {/* Task 3 & Task 7: Displaying office properties using JSX expressions */}
        <div className="single-office-details">
          <h3>Name: {office.name}</h3>
          
          {/* Task 6: Conditional Inline CSS for Rent */}
          <h4 className="rent-text">
            Rent: <span style={{ color: office.rent < 60000 ? "red" : "green" }}>
              Rs. {office.rent}
            </span>
          </h4>
          
          <h4>Address: {office.address}</h4>
        </div>
      </div>

      <hr className="divider" />

      {/* Task 4 & Task 5: Loop through officeSpaces using map() and display in cards */}
      <div className="office-spaces-section">
        <h2 className="section-heading">All Available Office Spaces</h2>
        
        <div className="cards-container">
          {officeSpaces.map((item) => (
            <div key={item.id} className="office-card">
              {/* Card Image */}
              <img src={item.image} alt={item.name} className="card-image" />
              
              {/* Card Details */}
              <div className="card-content">
                <h3>{item.name}</h3>
                
                {/* Task 6: Conditional inline styling for rent */}
                <p className="card-rent">
                  Rent: <span style={{ color: item.rent < 60000 ? "red" : "green" }}>
                    ₹{item.rent}
                  </span>
                </p>
                
                <p className="card-address">Address: {item.address}</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

export default App;
