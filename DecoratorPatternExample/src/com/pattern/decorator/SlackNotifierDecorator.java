package com.pattern.decorator;

public class SlackNotifierDecorator extends NotifierDecorator {
    public SlackNotifierDecorator(Notifier notifier) {
        super(notifier);
    }

    @Override
    public void send(String message) {
        super.send(message); // Send existing notification channels
        sendSlackMessage(message); // Add Slack channel behavior
    }

    private void sendSlackMessage(String message) {
        System.out.println("Sending Slack Channel Message: " + message);
    }
}
