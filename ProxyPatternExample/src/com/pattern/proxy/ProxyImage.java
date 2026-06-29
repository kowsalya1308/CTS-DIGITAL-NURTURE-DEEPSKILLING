package com.pattern.proxy;

public class ProxyImage implements Image {
    private String filename;
    private RealImage realImage;

    public ProxyImage(String filename) {
        this.filename = filename;
        // Do not load the real image in constructor (Lazy Initialization)
    }

    @Override
    public void display() {
        if (realImage == null) {
            // Load and cache the image on first call
            realImage = new RealImage(filename);
        }
        // Use cached image for display
        realImage.display();
    }
}
