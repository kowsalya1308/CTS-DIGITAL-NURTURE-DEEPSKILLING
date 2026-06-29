package com.dsa.exercise4;

public class EmployeeManagement {
    private Employee[] employees;
    private int size;

    public EmployeeManagement(int initialCapacity) {
        this.employees = new Employee[initialCapacity];
        this.size = 0;
    }

    /**
     * Add an employee to the array.
     * If the array is full, we double its capacity.
     * Time Complexity: O(1) amortized
     */
    public void addEmployee(Employee employee) {
        if (size == employees.length) {
            resize();
        }
        employees[size++] = employee;
        System.out.println("Employee added successfully: " + employee.getName());
    }

    // Helper method to resize the array when full
    private void resize() {
        Employee[] temp = new Employee[employees.length * 2];
        System.arraycopy(employees, 0, temp, 0, employees.length);
        employees = temp;
        System.out.println("Array resized. New capacity: " + employees.length);
    }

    /**
     * Search for an employee by ID.
     * Time Complexity: O(n)
     */
    public Employee searchEmployee(String employeeId) {
        for (int i = 0; i < size; i++) {
            if (employees[i].getEmployeeId().equals(employeeId)) {
                return employees[i];
            }
        }
        return null;
    }

    /**
     * Traverse and display all employee records.
     * Time Complexity: O(n)
     */
    public void traverseEmployees() {
        if (size == 0) {
            System.out.println("No employee records found.");
            return;
        }
        System.out.println("--- Employee Directory (Size: " + size + ") ---");
        for (int i = 0; i < size; i++) {
            System.out.println(employees[i]);
        }
        System.out.println("----------------------------------------------");
    }

    /**
     * Delete an employee by ID and shift subsequent elements to close the gap.
     * Time Complexity: O(n) due to shifting
     */
    public boolean deleteEmployee(String employeeId) {
        int index = -1;
        // Search for the employee
        for (int i = 0; i < size; i++) {
            if (employees[i].getEmployeeId().equals(employeeId)) {
                index = i;
                break;
            }
        }

        if (index == -1) {
            System.out.println("Employee with ID " + employeeId + " not found for deletion.");
            return false;
        }

        // Shift elements to the left to fill the gap
        for (int i = index; i < size - 1; i++) {
            employees[i] = employees[i + 1];
        }

        // Clear the last element and decrease size
        employees[size - 1] = null;
        size--;

        System.out.println("Employee with ID " + employeeId + " deleted successfully.");
        return true;
    }
}
