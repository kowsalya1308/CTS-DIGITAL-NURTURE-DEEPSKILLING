package com.pattern.decorator;

public class SMSNotifierDecorator extends NotifierDecorator {
    public SMSNotifierDecorator(Notifier notifier) {
        super(notifier);
    }

    @Override
    public void send(String message) {
        super.send(message); // Send existing notification channels
        sendSMS(message);    // Add SMS channel behavior
    }

    private void sendSMS(String message) {
        System.out.println("Sending SMS Notification: " + message);
    }
}
