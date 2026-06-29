package com.pattern.di;

public class CustomerService {
    // Dependency on abstraction, not concrete implementation
    private final CustomerRepository customerRepository;

    // Constructor Injection: dependency is provided via constructor
    public CustomerService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    public String getCustomerName(String customerId) {
        String name = customerRepository.findCustomerById(customerId);
        if (name == null) {
            return "Customer with ID '" + customerId + "' not found.";
        }
        return "Customer found: " + name;
    }
}
