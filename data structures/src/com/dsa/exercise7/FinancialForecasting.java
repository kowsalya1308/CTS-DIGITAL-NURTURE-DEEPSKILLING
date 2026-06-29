package com.dsa.exercise7;

public class FinancialForecasting {

    /**
     * Recursive method to calculate future value.
     * Formula: FV = PV * (1 + r)^n
     * Recurrence: FV(n) = FV(n - 1) * (1 + r), with FV(0) = PV
     * Time Complexity: O(n)
     * Space Complexity: O(n) due to call stack depth
     */
    public static double calculateFutureValueRecursive(double presentValue, double growthRate, int periods) {
        // Base case: no more periods left
        if (periods <= 0) {
            return presentValue;
        }
        // Recursive step: compound for one less period and multiply by (1 + growthRate)
        return calculateFutureValueRecursive(presentValue, growthRate, periods - 1) * (1 + growthRate);
    }

    /**
     * Optimized Iterative method to calculate future value.
     * Avoids recursion stack overhead (StackOverflowError).
     * Time Complexity: O(n)
     * Space Complexity: O(1)
     */
    public static double calculateFutureValueIterative(double presentValue, double growthRate, int periods) {
        double futureValue = presentValue;
        for (int i = 0; i < periods; i++) {
            futureValue *= (1 + growthRate);
        }
        return futureValue;
    }

    /**
     * Direct mathematical formula (most optimized).
     * Time Complexity: O(log n) (under the hood for Math.pow)
     * Space Complexity: O(1)
     */
    public static double calculateFutureValueDirect(double presentValue, double growthRate, int periods) {
        return presentValue * Math.pow(1 + growthRate, periods);
    }
}
