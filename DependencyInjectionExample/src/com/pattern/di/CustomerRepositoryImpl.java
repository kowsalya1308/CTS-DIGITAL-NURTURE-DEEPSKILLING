package com.pattern.di;

import java.util.HashMap;
import java.util.Map;

public class CustomerRepositoryImpl implements CustomerRepository {
    // Simulated in-memory "database"
    private Map<String, String> database;

    public CustomerRepositoryImpl() {
        database = new HashMap<>();
        database.put("C001", "Alice Johnson");
        database.put("C002", "Bob Williams");
        database.put("C003", "Charlie Brown");
    }

    @Override
    public String findCustomerById(String customerId) {
        return database.getOrDefault(customerId, null);
    }
}
