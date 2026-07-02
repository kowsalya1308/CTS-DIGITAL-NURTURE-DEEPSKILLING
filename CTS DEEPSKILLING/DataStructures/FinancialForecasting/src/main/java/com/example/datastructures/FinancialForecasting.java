package com.example.datastructures;

import java.util.HashMap;
import java.util.Map;

public class FinancialForecasting {
    /**
     * Calculate future value recursively using a base value and a fixed growth rate.
     * This example models value_n = value_{n-1} * (1 + growthRate).
     */
    public static double futureValueRecursive(double presentValue, double growthRate, int years) {
        if (years == 0) {
            return presentValue;
        }
        return futureValueRecursive(presentValue, growthRate, years - 1) * (1 + growthRate);
    }

    /**
     * Optimized recursive method using memoization to avoid repeated calculations.
     */
    public static double futureValueMemoized(double presentValue, double growthRate, int years) {
        Map<Integer, Double> memo = new HashMap<>();
        memo.put(0, presentValue);
        return futureValueMemoized(presentValue, growthRate, years, memo);
    }

    private static double futureValueMemoized(double presentValue, double growthRate, int years, Map<Integer, Double> memo) {
        if (memo.containsKey(years)) {
            return memo.get(years);
        }
        double value = futureValueMemoized(presentValue, growthRate, years - 1, memo) * (1 + growthRate);
        memo.put(years, value);
        return value;
    }
}
