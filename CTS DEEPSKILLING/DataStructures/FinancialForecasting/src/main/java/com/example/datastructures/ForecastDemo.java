package com.example.datastructures;

public class ForecastDemo {
    public static void main(String[] args) {
        double presentValue = 1000.0;
        double growthRate = 0.08; // 8% yearly growth
        int years = 5;

        System.out.println("--- Recursive Financial Forecasting ---");
        double forecastRecursive = FinancialForecasting.futureValueRecursive(presentValue, growthRate, years);
        System.out.printf("Future value after %d years (recursive): %.2f%n", years, forecastRecursive);

        double forecastMemoized = FinancialForecasting.futureValueMemoized(presentValue, growthRate, years);
        System.out.printf("Future value after %d years (memoized): %.2f%n", years, forecastMemoized);

        System.out.println("\nAnalysis:");
        System.out.println("A naive recursive algorithm has O(n) time complexity and O(n) call stack depth for this linear recurrence.");
        System.out.println("Memoization avoids repeated recalculation, keeping the time complexity at O(n) while reducing redundant work.");
        System.out.println("For this fixed-growth forecast, an iterative solution is also more efficient and avoids recursion overhead.");
    }
}
