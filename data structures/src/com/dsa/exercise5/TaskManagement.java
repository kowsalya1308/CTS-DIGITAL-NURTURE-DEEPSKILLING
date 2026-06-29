package com.dsa.exercise5;

public class TaskManagement {
    
    // Internal node structure for the singly linked list
    private static class Node {
        Task task;
        Node next;

        Node(Task task) {
            this.task = task;
            this.next = null;
        }
    }

    private Node head;
    private Node tail;

    public TaskManagement() {
        this.head = null;
        this.tail = null;
    }

    /**
     * Add a task to the end of the linked list.
     * Time Complexity: O(1) because we keep a tail reference.
     */
    public void addTask(Task task) {
        Node newNode = new Node(task);
        if (head == null) {
            head = newNode;
            tail = newNode;
        } else {
            tail.next = newNode;
            tail = newNode;
        }
        System.out.println("Task added: " + task.getTaskName());
    }

    /**
     * Search for a task by taskId.
     * Time Complexity: O(n)
     */
    public Task searchTask(String taskId) {
        Node current = head;
        while (current != null) {
            if (current.task.getTaskId().equals(taskId)) {
                return current.task;
            }
            current = current.next;
        }
        return null; // Not found
    }

    /**
     * Traverse and print all tasks.
     * Time Complexity: O(n)
     */
    public void traverseTasks() {
        if (head == null) {
            System.out.println("Task list is empty.");
            return;
        }
        System.out.println("--- Task List ---");
        Node current = head;
        while (current != null) {
            System.out.println(current.task);
            current = current.next;
        }
        System.out.println("-----------------");
    }

    /**
     * Delete a task by taskId.
     * Time Complexity: O(n) (since we need to search for the node first)
     */
    public boolean deleteTask(String taskId) {
        if (head == null) {
            System.out.println("Task list is empty. Cannot delete.");
            return false;
        }

        // Case 1: The task to delete is at the head
        if (head.task.getTaskId().equals(taskId)) {
            System.out.println("Task deleted: " + head.task.getTaskName());
            head = head.next;
            if (head == null) {
                tail = null; // List became empty
            }
            return true;
        }

        // Case 2: The task to delete is down the list
        Node prev = head;
        Node current = head.next;

        while (current != null) {
            if (current.task.getTaskId().equals(taskId)) {
                System.out.println("Task deleted: " + current.task.getTaskName());
                prev.next = current.next;
                // If we deleted the tail, update tail reference
                if (current == tail) {
                    tail = prev;
                }
                return true;
            }
            prev = current;
            current = current.next;
        }

        System.out.println("Task with ID " + taskId + " not found for deletion.");
        return false;
    }
}
