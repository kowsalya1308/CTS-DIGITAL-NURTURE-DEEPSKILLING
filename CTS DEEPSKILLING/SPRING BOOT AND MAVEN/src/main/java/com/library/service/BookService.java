package com.library.service;

import com.library.repository.BookRepository;

public class BookService {
    private BookRepository bookRepository;

    public BookService() {
    }

    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public void saveBook(String title) {
        System.out.println("BookService: Saving book '" + title + "'");
        if (bookRepository != null) {
            bookRepository.save(title);
        }
    }

    public void printRepository() {
        System.out.println("BookRepository instance: " + bookRepository);
    }
}
