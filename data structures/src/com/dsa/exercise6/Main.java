package com.dsa.exercise6;

import java.util.Arrays;

public class Main {
    public static void main(String[] sender) {
        System.out.println("=== Running Exercise 6: Library Management System ===");

        // Setup a list of books
        Book[] books = {
            new Book("B001", "The Great Gatsby", "F. Scott Fitzgerald"),
            new Book("B002", "To Kill a Mockingbird", "Harper Lee"),
            new Book("B003", "1984", "George Orwell"),
            new Book("B004", "Pride and Prejudice", "Jane Austen"),
            new Book("B005", "Moby Dick", "Herman Melville")
        };

        System.out.println("\nUnsorted books:");
        for (Book b : books) {
            System.out.println(b);
        }

        // Test Linear Search
        System.out.println("\n--- Testing Linear Search ---");
        String targetTitle = "1984";
        System.out.println("Searching for: " + targetTitle);
        Book foundLinear = LibraryManagement.linearSearchByTitle(books, targetTitle);
        System.out.println("Result: " + (foundLinear != null ? foundLinear : "Not Found"));

        // Sort books by title
        Book[] sortedBooks = books.clone();
        Arrays.sort(sortedBooks);

        System.out.println("\nSorted books (by title):");
        for (Book b : sortedBooks) {
            System.out.println(b);
        }

        // Test Binary Search
        System.out.println("\n--- Testing Binary Search ---");
        System.out.println("Searching for: " + targetTitle);
        Book foundBinary = LibraryManagement.binarySearchByTitle(sortedBooks, targetTitle);
        System.out.println("Result: " + (foundBinary != null ? foundBinary : "Not Found"));

        // Searching for non-existent book
        String fakeTitle = "The Hobbit";
        System.out.println("\nSearching for non-existent: " + fakeTitle);
        Book foundFake = LibraryManagement.binarySearchByTitle(sortedBooks, fakeTitle);
        System.out.println("Result: " + (foundFake != null ? foundFake : "Not Found"));
    }
}
