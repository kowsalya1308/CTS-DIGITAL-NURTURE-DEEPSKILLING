/**
 * GitClient.js
 * Service class to interact with the GitHub REST API.
 * 
 * Objectives:
 * - Uses Axios to retrieve users' repository lists.
 * - Formulates request URLs dynamically based on input user names.
 */
import axios from 'axios';

class GitClient {
  /**
   * Static method to fetch GitHub repositories for a given username.
   * @param {string} userName - The name of the GitHub user.
   * @returns {Promise} Axios request promise resolving to user repository data.
   */
  static getRepositories(userName) {
    // Build the request URL using template literals
    const url = `https://api.github.com/users/${userName}/repos`;
    
    // Return Axios promise to be resolved by the consumer
    return axios.get(url);
  }
}

// Export the GitClient class as default
export default GitClient;
