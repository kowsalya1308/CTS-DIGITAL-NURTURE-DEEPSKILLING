package com.pattern.command;

public class RemoteControl {
    private Command command;

    public void setCommand(Command command) {
        this.command = command;
    }

    public void pressButton() {
        if (command == null) {
            System.out.println("No command assigned to this remote button!");
            return;
        }
        command.execute();
    }
}
