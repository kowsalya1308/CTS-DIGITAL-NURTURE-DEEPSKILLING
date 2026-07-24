import { createContext } from 'react';

/**
 * ThemeContext provides the current theme ('light' or 'dark') to components.
 * It is initialized with a default value of 'light'.
 */
const ThemeContext = createContext('light');

export default ThemeContext;
