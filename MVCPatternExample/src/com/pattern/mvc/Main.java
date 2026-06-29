package com.pattern.mvc;

public class Main {
    public static void main(String[] sender) {
        System.out.println("=== Testing MVC Pattern (Student Records) ===");

        // Create Model
        Student student = new Student("Alice Johnson", "S1001", "A");

        // Create View
        StudentView view = new StudentView();

        // Create Controller (wires model + view)
        StudentController controller = new StudentController(student, view);

        // Initial display
        System.out.println("\n--- Initial Student Record ---");
        controller.updateView();

        // Update model via controller
        System.out.println("\n--- Updating Student Details via Controller ---");
        controller.setStudentName("Alice Johnson-Smith");
        controller.setStudentGrade("A+");

        // Display updated record
        System.out.println("\n--- Updated Student Record ---");
        controller.updateView();
    }
}
