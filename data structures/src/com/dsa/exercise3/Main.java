package com.dsa.exercise3;

public class Main {
    public static void main(String[] sender) {
        System.out.println("=== Running Exercise 3: Sorting Customer Orders ===");

        // Setup customer orders
        Order[] ordersForBubble = {
            new Order("O001", "Alice", 250.50),
            new Order("O002", "Bob", 120.00),
            new Order("O003", "Charlie", 450.00),
            new Order("O004", "David", 80.75),
            new Order("O005", "Eve", 300.00)
        };

        Order[] ordersForQuick = ordersForBubble.clone();

        System.out.println("\nOrders before sorting:");
        for (Order o : ordersForBubble) {
            System.out.println(o);
        }

        // Test Bubble Sort
        System.out.println("\n--- Sorting with Bubble Sort ---");
        Sort.bubbleSort(ordersForBubble);
        for (Order o : ordersForBubble) {
            System.out.println(o);
        }

        // Test Quick Sort
        System.out.println("\n--- Sorting with Quick Sort ---");
        Sort.quickSort(ordersForQuick);
        for (Order o : ordersForQuick) {
            System.out.println(o);
        }
    }
}
