package com.dsa.exercise4;

public class Main {
    public static void main(String[] sender) {
        System.out.println("=== Running Exercise 4: Employee Management System ===");

        // Create system with small capacity to demonstrate resizing
        EmployeeManagement system = new EmployeeManagement(2);

        Employee e1 = new Employee("E001", "John Doe", "Software Engineer", 80000);
        Employee e2 = new Employee("E002", "Jane Smith", "Project Manager", 95000);
        Employee e3 = new Employee("E003", "Bob Johnson", "QA Analyst", 70000);

        System.out.println("\n--- Adding Employees ---");
        system.addEmployee(e1);
        system.addEmployee(e2);
        system.addEmployee(e3); // This should trigger dynamic resizing

        system.traverseEmployees();

        System.out.println("\n--- Searching for Employee E002 ---");
        Employee found = system.searchEmployee("E002");
        System.out.println("Result: " + (found != null ? found : "Not Found"));

        System.out.println("\n--- Deleting Employee E001 ---");
        system.deleteEmployee("E001");

        // Verify deletion and shifting
        system.traverseEmployees();

        System.out.println("\n--- Searching for Deleted Employee E001 ---");
        Employee foundDeleted = system.searchEmployee("E001");
        System.out.println("Result: " + (foundDeleted != null ? foundDeleted : "Not Found"));
    }
}
