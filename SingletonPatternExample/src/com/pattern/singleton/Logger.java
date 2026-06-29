package com.pattern.singleton;

public class Logger {
    // volatile ensures changes are immediately visible across threads
    private static volatile Logger instance;

    // Private constructor prevents direct instantiation
    private Logger() {
        System.out.println("Logger initialized (Private Constructor).");
    }

    // Thread-safe double-checked locking
    public static Logger getInstance() {
        if (instance == null) {
            synchronized (Logger.class) {
                if (instance == null) {
                    instance = new Logger();
                }
            }
        }
        return instance;
    }

    public void log(String message) {
        System.out.println("[LOG] " + message);
    }
}
