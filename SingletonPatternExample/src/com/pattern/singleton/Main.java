package com.pattern.singleton;

public class Main {
    public static void main(String[] sender) {
        System.out.println("=== Testing Singleton Pattern (Logger) ===");

        // Get two instances of Logger
        Logger logger1 = Logger.getInstance();
        Logger logger2 = Logger.getInstance();

        // Print their hashcodes or compare references
        System.out.println("Logger 1 HashCode: " + logger1.hashCode());
        System.out.println("Logger 2 HashCode: " + logger2.hashCode());

        // Verify they are the same instance
        if (logger1 == logger2) {
            System.out.println("Success: Both logger1 and logger2 references point to the same instance.");
        } else {
            System.out.println("Failure: logger1 and logger2 reference different instances!");
        }

        // Test logging functionality
        logger1.log("This is a log message via logger1.");
        logger2.log("This is another log message via logger2.");
    }
}
