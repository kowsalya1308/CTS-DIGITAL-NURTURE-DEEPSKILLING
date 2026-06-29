package com.dsa.exercise1;

public class Main {
    public static void main(String[] sender) {
        System.out.println("=== Running Exercise 1: Inventory Management System ===");
        
        Inventory inventory = new Inventory();

        // 1. Add Products
        Product p1 = new Product("P001", "Laptop", 10, 999.99);
        Product p2 = new Product("P002", "Smartphone", 25, 499.99);
        Product p3 = new Product("P003", "Headphones", 50, 79.99);

        System.out.println("\n--- Adding Products ---");
        inventory.addProduct(p1);
        inventory.addProduct(p2);
        inventory.addProduct(p3);

        // Display current inventory
        inventory.displayProducts();

        // 2. Update Product
        System.out.println("\n--- Updating Product P002 ---");
        inventory.updateProduct("P002", "Smartphone Pro", 30, 549.99);
        
        // Display after update
        inventory.displayProducts();

        // 3. Delete Product
        System.out.println("\n--- Deleting Product P003 ---");
        inventory.deleteProduct("P003");

        // Display final inventory
        inventory.displayProducts();

        // Attempting to delete non-existent product
        System.out.println("\n--- Deleting Non-Existent Product P999 ---");
        inventory.deleteProduct("P999");
    }
}
