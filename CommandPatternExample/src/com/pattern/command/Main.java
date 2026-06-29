package com.pattern.command;

public class Main {
    public static void main(String[] sender) {
        System.out.println("=== Testing Command Pattern (Remote Control) ===");

        // Create Receiver
        Light livingRoomLight = new Light("Living Room");

        // Create Concrete Commands
        Command lightOn = new LightOnCommand(livingRoomLight);
        Command lightOff = new LightOffCommand(livingRoomLight);

        // Create Invoker
        RemoteControl remote = new RemoteControl();

        // 1. Press button when no command is assigned
        System.out.println("\nPressing button without command:");
        remote.pressButton();

        // 2. Set Light On command and press button
        System.out.println("\nPressing button with Light On command:");
        remote.setCommand(lightOn);
        remote.pressButton();

        // 3. Set Light Off command and press button
        System.out.println("\nPressing button with Light Off command:");
        remote.setCommand(lightOff);
        remote.pressButton();
    }
}
