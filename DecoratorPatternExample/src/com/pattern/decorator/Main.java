package com.pattern.decorator;

public class Main {
    public static void main(String[] sender) {
        System.out.println("=== Testing Decorator Pattern (Notifier Decorators) ===");

        // 1. Send base notification (Email only)
        System.out.println("\n--- Testing Base Email Notifier ---");
        Notifier emailNotifier = new EmailNotifier();
        emailNotifier.send("System maintenance in 1 hour.");

        // 2. Decorate with SMS channel (Email + SMS)
        System.out.println("\n--- Testing Decorated Email + SMS Notifier ---");
        Notifier emailAndSMS = new SMSNotifierDecorator(emailNotifier);
        emailAndSMS.send("Server overload detected!");

        // 3. Decorate with Slack channel as well (Email + SMS + Slack)
        System.out.println("\n--- Testing Decorated Email + SMS + Slack Notifier ---");
        Notifier multiChannel = new SlackNotifierDecorator(emailAndSMS);
        multiChannel.send("Critical bug reported in production.");
    }
}
