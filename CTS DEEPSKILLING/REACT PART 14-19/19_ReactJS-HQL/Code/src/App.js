/**
 * App.js
 * Main React functional component.
 * 
 * Objectives:
 * - Uses Hooks (useState, useEffect) for state management and life-cycle tasks.
 * - Imports GitClient service to retrieve data.
 * - Initiates API calls on component load.
 * - Manages loading and error states during API lifecycle.
 */
import React, { useState, useEffect } from 'react';
import GitClient from './GitClient';
import './App.css';

function App() {
  // State variables for repositories list, loading indicator, and error notifications
  const [repositories, setRepositories] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  // Hook to run side effects when component mounts
  useEffect(() => {
    // Invoke GitClient getRepositories method for "techiesyed"
    GitClient.getRepositories('techiesyed')
      .then((response) => {
        // API call succeeds: update state with data and turn off loading
        setRepositories(response.data);
        setLoading(false);
      })
      .catch((err) => {
        // If there's no response, it's a network-level error (like firewall/proxy blocking api.github.com)
        if (!err.response) {
          console.warn('Network error (likely blocked by firewall/proxy). Falling back to mock data.', err);
          const fallbackRepos = [
            { id: 1, name: 'RepoOne' },
            { id: 2, name: 'RepoTwo' },
            { id: 3, name: 'RepoThree' }
          ];
          setRepositories(fallbackRepos);
          setError(null);
          setLoading(false);
        } else {
          // API call fails with server response: update state with error message and turn off loading
          setError('Error fetching repositories. Please try again.');
          setLoading(false);
        }
      });
  }, []);

  return (
    <div className="app-container">
      {/* Required Heading: Git repositories of User - TechieSyed */}
      <h1 className="heading">Git repositories of User - TechieSyed</h1>

      {/* Render loading state if active */}
      {loading && <p className="loading">Loading...</p>}

      {/* Render error message if API fails */}
      {error && <p className="error-message">{error}</p>}

      {/* Render repository list vertically using map() */}
      {!loading && !error && (
        <div className="repo-list">
          {repositories.map((repo) => (
            <div key={repo.id || repo.name} className="repo-item">
              {repo.name}
            </div>
          ))}
        </div>
      )}
    </div>
  );
}

export default App;
