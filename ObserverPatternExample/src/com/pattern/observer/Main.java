package com.pattern.observer;

public class Main {
    public static void main(String[] sender) {
        System.out.println("=== Testing Observer Pattern (Stock Market Monitoring) ===");

        StockMarket stockMarket = new StockMarket();

        // Create Observers
        Observer mobile1 = new MobileApp("iPhone Client");
        Observer mobile2 = new MobileApp("Android Client");
        Observer webApp = new WebApp("Admin Panel Dashboard");

        // Register Observers
        System.out.println("\n--- Registering Observers ---");
        stockMarket.register(mobile1);
        stockMarket.register(mobile2);
        stockMarket.register(webApp);

        // Update Stock Price (triggers notifications)
        stockMarket.setStockPrice("GOOGL", 175.50);
        stockMarket.setStockPrice("AAPL", 182.25);

        // Deregister one Observer
        System.out.println("\n--- Deregistering Android Client ---");
        stockMarket.deregister(mobile2);

        // Update Stock Price again (Android Client should not receive updates)
        stockMarket.setStockPrice("MSFT", 420.10);
    }
}
