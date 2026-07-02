package com.example.datastructures;

import java.util.Arrays;

public class SearchDemo {
    public static void main(String[] args) {
        Product[] products = {
            new Product(101, "Running Shoes", "Sports"),
            new Product(102, "Wireless Mouse", "Electronics"),
            new Product(103, "Coffee Maker", "Home"),
            new Product(104, "Yoga Mat", "Fitness"),
            new Product(105, "Smartphone", "Electronics")
        };

        System.out.println("--- Linear Search ---");
        int indexLinear = linearSearch(products, "Coffee Maker");
        printSearchResult(indexLinear, products);

        System.out.println("\n--- Binary Search ---");
        Product[] sortedProducts = Arrays.copyOf(products, products.length);
        Arrays.sort(sortedProducts, (p1, p2) -> p1.getProductName().compareTo(p2.getProductName()));
        int indexBinary = binarySearch(sortedProducts, "Coffee Maker");
        printSearchResult(indexBinary, sortedProducts);

        System.out.println("\nAnalysis:");
        System.out.println("Linear search: O(n) time complexity. Best case O(1), average/worst case O(n).");
        System.out.println("Binary search: O(log n) time complexity on sorted data. Best case O(1), average/worst case O(log n).");
        System.out.println("Binary search is typically better for large sorted collections, while linear search is simple and useful for small or unsorted data.");
    }

    public static int linearSearch(Product[] products, String targetName) {
        for (int i = 0; i < products.length; i++) {
            if (products[i].getProductName().equalsIgnoreCase(targetName)) {
                return i;
            }
        }
        return -1;
    }

    public static int binarySearch(Product[] products, String targetName) {
        int left = 0;
        int right = products.length - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;
            int comparison = products[mid].getProductName().compareToIgnoreCase(targetName);

            if (comparison == 0) {
                return mid;
            } else if (comparison < 0) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return -1;
    }

    private static void printSearchResult(int index, Product[] products) {
        if (index >= 0) {
            System.out.println("Found product at index " + index + ": " + products[index]);
        } else {
            System.out.println("Product not found.");
        }
    }
}
