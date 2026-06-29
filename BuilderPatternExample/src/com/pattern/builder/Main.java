package com.pattern.builder;

public class Main {
    public static void main(String[] sender) {
        System.out.println("=== Testing Builder Pattern (Computer Builder) ===");

        // 1. Basic configuration (only required parts)
        Computer basicComp = new Computer.Builder("Intel i3", "8GB", "256GB SSD")
                .build();
        
        System.out.println("\nBasic PC Configuration:");
        System.out.println(basicComp);

        // 2. High-end configuration (with optional parts)
        Computer gamingComp = new Computer.Builder("Intel i9", "32GB", "1TB NVMe SSD")
                .setGPU("NVIDIA RTX 4090")
                .setOS("Windows 11 Pro")
                .setWiFi(true)
                .build();

        System.out.println("\nGaming PC Configuration:");
        System.out.println(gamingComp);

        // 3. Office configuration (some optional parts)
        Computer officeComp = new Computer.Builder("AMD Ryzen 5", "16GB", "512GB SSD")
                .setOS("Linux Ubuntu")
                .setWiFi(true)
                .build();

        System.out.println("\nOffice PC Configuration:");
        System.out.println(officeComp);
    }
}
