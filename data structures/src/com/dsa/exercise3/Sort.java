package com.dsa.exercise3;

public class Sort {

    /**
     * Bubble Sort implementation to sort orders by totalPrice (ascending).
     * Time Complexity: O(n^2)
     * Space Complexity: O(1)
     */
    public static void bubbleSort(Order[] orders) {
        int n = orders.length;
        boolean swapped;
        for (int i = 0; i < n - 1; i++) {
            swapped = false;
            for (int j = 0; j < n - i - 1; j++) {
                if (orders[j].getTotalPrice() > orders[j + 1].getTotalPrice()) {
                    // Swap orders[j] and orders[j+1]
                    Order temp = orders[j];
                    orders[j] = orders[j + 1];
                    orders[j + 1] = temp;
                    swapped = true;
                }
            }
            // If no elements were swapped in the inner loop, the array is already sorted.
            if (!swapped) {
                break;
            }
        }
    }

    /**
     * Quick Sort helper method to start the sorting process.
     */
    public static void quickSort(Order[] orders) {
        if (orders != null && orders.length > 1) {
            quickSort(orders, 0, orders.length - 1);
        }
    }

    /**
     * Quick Sort implementation to sort orders by totalPrice (ascending).
     * Time Complexity: O(n log n) average, O(n^2) worst-case
     * Space Complexity: O(log n) call stack space
     */
    private static void quickSort(Order[] orders, int low, int high) {
        if (low < high) {
            int partitionIndex = partition(orders, low, high);

            // Recursively sort elements before and after partition
            quickSort(orders, low, partitionIndex - 1);
            quickSort(orders, partitionIndex + 1, high);
        }
    }

    private static int partition(Order[] orders, int low, int high) {
        // Choose the rightmost element as pivot
        double pivotPrice = orders[high].getTotalPrice();
        int i = (low - 1);

        for (int j = low; j < high; j++) {
            // If current element is smaller than or equal to pivot
            if (orders[j].getTotalPrice() <= pivotPrice) {
                i++;
                // Swap orders[i] and orders[j]
                Order temp = orders[i];
                orders[i] = orders[j];
                orders[j] = temp;
            }
        }

        // Swap the pivot element with the element at i+1
        Order temp = orders[i + 1];
        orders[i + 1] = orders[high];
        orders[high] = temp;

        return i + 1;
    }
}
