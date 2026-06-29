package com.pattern.builder;

public class Computer {
    // Required attributes
    private String CPU;
    private String RAM;
    private String Storage;

    // Optional attributes
    private String GPU;
    private String OS;
    private boolean hasWiFi;

    // Private constructor so that instantiation is only possible via Builder
    private Computer(Builder builder) {
        this.CPU = builder.CPU;
        this.RAM = builder.RAM;
        this.Storage = builder.Storage;
        this.GPU = builder.GPU;
        this.OS = builder.OS;
        this.hasWiFi = builder.hasWiFi;
    }

    // Getters only (immutability)
    public String getCPU() { return CPU; }
    public String getRAM() { return RAM; }
    public String getStorage() { return Storage; }
    public String getGPU() { return GPU; }
    public String getOS() { return OS; }
    public boolean hasWiFi() { return hasWiFi; }

    @Override
    public String toString() {
        return "Computer{" +
                "CPU='" + CPU + '\'' +
                ", RAM='" + RAM + '\'' +
                ", Storage='" + Storage + '\'' +
                ", GPU='" + (GPU != null ? GPU : "Integrated") + '\'' +
                ", OS='" + (OS != null ? OS : "None") + '\'' +
                ", hasWiFi=" + hasWiFi +
                '}';
    }

    // Static nested Builder class
    public static class Builder {
        // Required attributes
        private String CPU;
        private String RAM;
        private String Storage;

        // Optional attributes
        private String GPU;
        private String OS;
        private boolean hasWiFi;

        // Builder constructor with required attributes
        public Builder(String CPU, String RAM, String Storage) {
            this.CPU = CPU;
            this.RAM = RAM;
            this.Storage = Storage;
        }

        // Setter-like methods for optional attributes returning Builder instance
        public Builder setGPU(String GPU) {
            this.GPU = GPU;
            return this;
        }

        public Builder setOS(String OS) {
            this.OS = OS;
            return this;
        }

        public Builder setWiFi(boolean hasWiFi) {
            this.hasWiFi = hasWiFi;
            return this;
        }

        // Method to construct the final Computer object
        public Computer build() {
            return new Computer(this);
        }
    }
}
