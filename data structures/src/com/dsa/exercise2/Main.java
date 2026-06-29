package com.dsa.exercise2;

import java.util.Arrays;

public class Main {
    public static void main(String[] sender) {
        System.out.println("=== Running Exercise 2: E-commerce Platform Search ===");

        // Create an unsorted list of products
        Product[] products = {
            new Product("P103", "Sony Headphones", "Electronics"),
            new Product("P101", "Apple iPhone", "Electronics"),
            new Product("P105", "Nike Shoes", "Apparel"),
            new Product("P102", "Dell Laptop", "Electronics"),
            new Product("P104", "Levi Jeans", "Apparel")
        };

        System.out.println("\nUnsorted Products (for Linear Search):");
        for (Product p : products) {
            System.out.println(p);
        }

        // Test Linear Search
        System.out.println("\n--- Testing Linear Search ---");
        String target1 = "Dell Laptop";
        System.out.println("Searching for: " + target1);
        Product res1 = Search.linearSearch(products, target1);
        System.out.println("Result: " + (res1 != null ? res1 : "Not Found"));

        String target2 = "Samsung TV";
        System.out.println("Searching for: " + target2);
        Product res2 = Search.linearSearch(products, target2);
        System.out.println("Result: " + (res2 != null ? res2 : "Not Found"));

        // Sort products for Binary Search
        Product[] sortedProducts = products.clone();
        Arrays.sort(sortedProducts);

        System.out.println("\nSorted Products (for Binary Search):");
        for (Product p : sortedProducts) {
            System.out.println(p);
        }

        // Test Binary Search
        System.out.println("\n--- Testing Binary Search ---");
        System.out.println("Searching for: " + target1);
        Product res3 = Search.binarySearch(sortedProducts, target1);
        System.out.println("Result: " + (res3 != null ? res3 : "Not Found"));

        System.out.println("Searching for: " + target2);
        Product res4 = Search.binarySearch(sortedProducts, target2);
        System.out.println("Result: " + (res4 != null ? res4 : "Not Found"));
    }
}
