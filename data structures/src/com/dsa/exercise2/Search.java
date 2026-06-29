package com.dsa.exercise2;

public class Search {

    /**
     * Linear Search implementation to find a product by name.
     * Time Complexity: O(n)
     * Space Complexity: O(1)
     */
    public static Product linearSearch(Product[] products, String targetName) {
        if (products == null || targetName == null) {
            return null;
        }
        for (Product product : products) {
            if (product != null && product.getProductName().equalsIgnoreCase(targetName)) {
                return product;
            }
        }
        return null;
    }

    /**
     * Binary Search implementation to find a product by name in a sorted array.
     * Assumes the array is sorted by productName (case-insensitive).
     * Time Complexity: O(log n)
     * Space Complexity: O(1)
     */
    public static Product binarySearch(Product[] sortedProducts, String targetName) {
        if (sortedProducts == null || targetName == null) {
            return null;
        }
        int low = 0;
        int high = sortedProducts.length - 1;

        while (low <= high) {
            int mid = low + (high - low) / 2;
            Product midProduct = sortedProducts[mid];
            
            if (midProduct == null) {
                // Handle possible null values in array
                high--;
                continue;
            }

            int comparison = midProduct.getProductName().compareToIgnoreCase(targetName);

            if (comparison == 0) {
                return midProduct; // Found
            } else if (comparison < 0) {
                low = mid + 1; // Target is in the right half
            } else {
                high = mid - 1; // Target is in the left half
            }
        }
        return null; // Not found
    }
}
