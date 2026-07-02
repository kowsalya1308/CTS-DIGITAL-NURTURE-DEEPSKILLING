package com.library;

import com.library.service.BookService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LibraryManagementApplication {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");

        BookService bookService = context.getBean("bookService", BookService.class);
        bookService.saveBook("Spring Framework Essentials");

        BookService constructorInjectedService = context.getBean("bookServiceConstructor", BookService.class);
        constructorInjectedService.saveBook("Constructor Injection Book");
    }
}
