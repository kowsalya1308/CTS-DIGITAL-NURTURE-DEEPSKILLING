// GetUser.js: Class Component that fetches a random user's details.
// This component performs an asynchronous API call to https://api.randomuser.me/
// inside the componentDidMount() lifecycle method, maintains loading, error, and
// person state, and displays the user's name and profile image.

import React from 'react';

class GetUser extends React.Component {
  constructor(props) {
    super(props);
    // Task 2: Initialize the state with person as null, loading as true, and error as null
    this.state = {
      person: null,
      loading: true,
      error: null
    };
  }

  // Task 3: Inside async componentDidMount(), fetch data from api.randomuser.me
  async componentDidMount() {
    const url = 'https://api.randomuser.me/';
    try {
      const response = await fetch(url);
      
      // If the response is not successful, throw an error to catch it
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      
      const data = await response.json();
      
      // Store data.results[0] inside the state and set loading to false
      this.setState({
        person: data.results[0],
        loading: false,
        error: null
      });
    } catch (err) {
      // Handle errors and store the error message in the state
      this.setState({
        person: null,
        loading: false,
        error: 'Unable to load user details.'
      });
    }
  }

  render() {
    const { person, loading, error } = this.state;

    // Task 4: While data is loading, display Loading... in blue
    if (loading) {
      return <div className="loading">Loading...</div>;
    }

    // Display the error message in red if fetching fails
    if (error) {
      return <div className="error">{error}</div>;
    }

    // Task 5: After successful API response, display the Title, First Name, Last Name, and Image
    if (person) {
      return (
        <div className="user-card">
          <h1>
            {person.name.title} {person.name.first} {person.name.last}
          </h1>
          <img
            src={person.picture.large}
            alt={`${person.name.first} ${person.name.last}`}
            className="user-image"
          />
        </div>
      );
    }

    return null;
  }
}

export default GetUser;
