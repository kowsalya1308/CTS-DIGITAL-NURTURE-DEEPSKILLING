package com.example.junitexercises;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

public class CalculatorTest {
    private Calculator calculator;

    @Before
    public void setUp() {
        calculator = new Calculator();
    }

    @After
    public void tearDown() {
        calculator = null;
    }

    @Test
    public void testAdd() {
        // Arrange
        int a = 2;
        int b = 3;

        // Act
        int result = calculator.add(a, b);

        // Assert
        assertEquals(5, result);
    }

    @Test
    public void testSubtract() {
        // Arrange
        int a = 5;
        int b = 2;

        // Act
        int result = calculator.subtract(a, b);

        // Assert
        assertEquals(3, result);
    }

    @Test
    public void testIsPositive() {
        // Arrange
        int value = 10;

        // Act
        boolean result = calculator.isPositive(value);

        // Assert
        assertTrue(result);
    }

    @Test
    public void testAssertions() {
        assertEquals(5, 2 + 3);
        assertTrue(5 > 3);
        assertFalse(5 < 3);
        assertNull(null);
        assertNotNull(new Object());
    }
}
