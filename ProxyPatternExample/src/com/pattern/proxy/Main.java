package com.pattern.proxy;

public class Main {
    public static void main(String[] sender) {
        System.out.println("=== Testing Proxy Pattern (Lazy Loading Image Viewer) ===");

        Image image = new ProxyImage("high_res_photo_50mb.png");

        // The image is not loaded yet
        System.out.println("\nProxyImage created. Ready to show.");

        // First display: image will load from the remote server
        System.out.println("\n--- First Call to display() (Image needs loading) ---");
        image.display();

        // Second display: image is loaded, it should display instantly
        System.out.println("\n--- Second Call to display() (Should use cached instance) ---");
        image.display();
    }
}
