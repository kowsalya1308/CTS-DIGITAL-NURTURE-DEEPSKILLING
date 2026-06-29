package com.pattern.proxy;

public class RealImage implements Image {
    private String filename;

    public RealImage(String filename) {
        this.filename = filename;
        loadFromRemoteServer();
    }

    private void loadFromRemoteServer() {
        System.out.println("Loading image '" + filename + "' from remote server (Simulated High Latency)...");
        try {
            Thread.sleep(1000); // Simulate network delay
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        System.out.println("Image '" + filename + "' loaded successfully.");
    }

    @Override
    public void display() {
        System.out.println("Displaying image: " + filename);
    }
}
