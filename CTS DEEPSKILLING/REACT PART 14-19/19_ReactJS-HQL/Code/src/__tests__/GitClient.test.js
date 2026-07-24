/**
 * GitClient.test.js
 * Jest unit tests for the GitClient class.
 * 
 * Objectives:
 * - Mock Axios dependency to bypass network request creation.
 * - Test correct formulation of the request URL for GitClient.getRepositories.
 * - Assert that returned repository data matches mock responses exactly.
 */
import axios from 'axios';
import GitClient from '../GitClient';

// Mock axios module completely to control its resolves and rejects
jest.mock('axios');

describe('Git Client Tests', () => {
  test('should return repository names for techiesyed', async () => {
    // Dummy repository data as defined in guidelines
    const mockRepos = [
      { name: 'RepoOne' },
      { name: 'RepoTwo' },
      { name: 'RepoThree' }
    ];

    // Mock axios.get to resolve with our custom dummy repository structure
    axios.get.mockResolvedValue({
      data: mockRepos
    });

    // Invoke getRepositories static method under test
    const response = await GitClient.getRepositories('techiesyed');

    // Assertion 1: Verify axios.get was triggered with correct API URL
    expect(axios.get).toHaveBeenCalledWith('https://api.github.com/users/techiesyed/repos');

    // Assertion 2: Verify response.data is equivalent to mockRepos
    expect(response.data).toEqual(mockRepos);
  });
});
