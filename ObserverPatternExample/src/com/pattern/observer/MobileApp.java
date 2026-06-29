package com.pattern.observer;

public class MobileApp implements Observer {
    private String name;

    public MobileApp(String name) {
        this.name = name;
    }

    @Override
    public void update(String stockSymbol, double price) {
        System.out.println("[Mobile App - " + name + "] Notification: Stock " + stockSymbol + " changed to $" + price);
    }
}
