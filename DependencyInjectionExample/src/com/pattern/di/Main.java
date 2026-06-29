package com.pattern.di;

public class Main {
    public static void main(String[] sender) {
        System.out.println("=== Testing Dependency Injection Pattern (Customer Management) ===");

        // Compose dependencies manually (manual DI / "Poor Man's DI")
        CustomerRepository repository = new CustomerRepositoryImpl();
        CustomerService service = new CustomerService(repository);

        // Query existing customers
        System.out.println("\n--- Looking up Customers ---");
        System.out.println(service.getCustomerName("C001"));
        System.out.println(service.getCustomerName("C002"));
        System.out.println(service.getCustomerName("C003"));

        // Query a non-existent customer
        System.out.println(service.getCustomerName("C999"));
    }
}
