package com.dsa.exercise7;

public class Main {
    public static void main(String[] sender) {
        System.out.println("=== Running Exercise 7: Financial Forecasting ===");

        double pv = 1000.0;     // Present Value ($1,000)
        double rate = 0.05;     // 5% growth rate
        int periods = 10;       // 10 years/periods

        System.out.println("Initial Capital (PV): $" + pv);
        System.out.println("Annual Growth Rate: " + (rate * 100) + "%");
        System.out.println("Forecasting Period: " + periods + " years");

        // 1. Recursive calculation
        double fvRecursive = FinancialForecasting.calculateFutureValueRecursive(pv, rate, periods);
        System.out.printf("\nFuture Value (Recursive): $%.2f%n", fvRecursive);

        // 2. Iterative calculation
        double fvIterative = FinancialForecasting.calculateFutureValueIterative(pv, rate, periods);
        System.out.printf("Future Value (Iterative): $%.2f%n", fvIterative);

        // 3. Direct math calculation
        double fvDirect = FinancialForecasting.calculateFutureValueDirect(pv, rate, periods);
        System.out.printf("Future Value (Direct Formula): $%.2f%n", fvDirect);

        // Discussion/Optimization Demonstration: Stack Overflow Risk
        System.out.println("\n--- Demonstration of Recursion Limitations (Large Periods) ---");
        int largePeriods = 10000;
        System.out.println("Forecasting for: " + largePeriods + " periods...");

        // Try direct first
        double fvDirectLarge = FinancialForecasting.calculateFutureValueDirect(pv, rate, largePeriods);
        System.out.printf("Direct Formula result: $%.2f%n", fvDirectLarge);

        // Try iterative
        double fvIterativeLarge = FinancialForecasting.calculateFutureValueIterative(pv, rate, largePeriods);
        System.out.printf("Iterative result: $%.2f%n", fvIterativeLarge);

        // Attempt recursive with try-catch to show stack overflow
        try {
            System.out.println("Attempting recursive method with " + largePeriods + " periods...");
            double fvRecursiveLarge = FinancialForecasting.calculateFutureValueRecursive(pv, rate, largePeriods);
            System.out.printf("Recursive result: $%.2f%n", fvRecursiveLarge);
        } catch (StackOverflowError e) {
            System.out.println("Result: [FAILED] StackOverflowError occurred due to call stack depth limitations!");
        }
    }
}
