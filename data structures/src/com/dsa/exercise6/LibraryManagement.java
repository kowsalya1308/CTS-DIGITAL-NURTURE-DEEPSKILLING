package com.dsa.exercise6;

public class LibraryManagement {

    /**
     * Linear Search implementation to find a book by its title.
     * Time Complexity: O(n)
     * Space Complexity: O(1)
     */
    public static Book linearSearchByTitle(Book[] books, String targetTitle) {
        if (books == null || targetTitle == null) {
            return null;
        }
        for (Book book : books) {
            if (book != null && book.getTitle().equalsIgnoreCase(targetTitle)) {
                return book;
            }
        }
        return null;
    }

    /**
     * Binary Search implementation to find a book by its title.
     * Assumes the book array is sorted by title (case-insensitive).
     * Time Complexity: O(log n)
     * Space Complexity: O(1)
     */
    public static Book binarySearchByTitle(Book[] sortedBooks, String targetTitle) {
        if (sortedBooks == null || targetTitle == null) {
            return null;
        }
        int low = 0;
        int high = sortedBooks.length - 1;

        while (low <= high) {
            int mid = low + (high - low) / 2;
            Book midBook = sortedBooks[mid];

            if (midBook == null) {
                high--;
                continue;
            }

            int comparison = midBook.getTitle().compareToIgnoreCase(targetTitle);

            if (comparison == 0) {
                return midBook; // Found
            } else if (comparison < 0) {
                low = mid + 1; // Target is in the right half
            } else {
                high = mid - 1; // Target is in the left half
            }
        }
        return null; // Not found
    }
}
