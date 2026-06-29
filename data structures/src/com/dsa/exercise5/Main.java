package com.dsa.exercise5;

public class Main {
    public static void main(String[] sender) {
        System.out.println("=== Running Exercise 5: Task Management System ===");

        TaskManagement taskList = new TaskManagement();

        Task t1 = new Task("T001", "Design Database Schema", "In Progress");
        Task t2 = new Task("T002", "Implement Authentication", "Todo");
        Task t3 = new Task("T003", "Write Unit Tests", "Todo");

        System.out.println("\n--- Adding Tasks ---");
        taskList.addTask(t1);
        taskList.addTask(t2);
        taskList.addTask(t3);

        taskList.traverseTasks();

        System.out.println("\n--- Searching for Task T002 ---");
        Task found = taskList.searchTask("T002");
        System.out.println("Result: " + (found != null ? found : "Not Found"));

        System.out.println("\n--- Deleting Task T001 (Head node) ---");
        taskList.deleteTask("T001");

        taskList.traverseTasks();

        System.out.println("\n--- Deleting Task T003 (Tail node) ---");
        taskList.deleteTask("T003");

        taskList.traverseTasks();

        System.out.println("\n--- Searching for Deleted Task T001 ---");
        Task foundDeleted = taskList.searchTask("T001");
        System.out.println("Result: " + (foundDeleted != null ? foundDeleted : "Not Found"));
    }
}
