package com.dsa.exercise1;

import java.util.HashMap;
import java.util.Map;

public class Inventory {
    private Map<String, Product> products;

    public Inventory() {
        this.products = new HashMap<>();
    }

    // Add a product
    public void addProduct(Product product) {
        if (products.containsKey(product.getProductId())) {
            System.out.println("Product with ID " + product.getProductId() + " already exists.");
            return;
        }
        products.put(product.getProductId(), product);
        System.out.println("Product added successfully: " + product.getProductName());
    }

    // Update a product
    public boolean updateProduct(String productId, String newName, int newQuantity, double newPrice) {
        Product product = products.get(productId);
        if (product == null) {
            System.out.println("Product with ID " + productId + " not found for update.");
            return false;
        }
        product.setProductName(newName);
        product.setQuantity(newQuantity);
        product.setPrice(newPrice);
        System.out.println("Product updated successfully: " + productId);
        return true;
    }

    // Delete a product
    public boolean deleteProduct(String productId) {
        if (!products.containsKey(productId)) {
            System.out.println("Product with ID " + productId + " not found for deletion.");
            return false;
        }
        products.remove(productId);
        System.out.println("Product with ID " + productId + " deleted successfully.");
        return true;
    }

    // Get a product
    public Product getProduct(String productId) {
        return products.get(productId);
    }

    // Display all products
    public void displayProducts() {
        if (products.isEmpty()) {
            System.out.println("Inventory is empty.");
            return;
        }
        System.out.println("--- Current Inventory ---");
        for (Product product : products.values()) {
            System.out.println(product);
        }
        System.out.println("-------------------------");
    }
}
