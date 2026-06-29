package com.pattern.observer;

public class WebApp implements Observer {
    private String name;

    public WebApp(String name) {
        this.name = name;
    }

    @Override
    public void update(String stockSymbol, double price) {
        System.out.println("[Web WebApp - " + name + "] Display: Stock " + stockSymbol + " is trading at $" + price);
    }
}
