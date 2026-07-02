package com.example.junitexercises;

public class MyService {
    private final ExternalApi externalApi;

    public MyService(ExternalApi externalApi) {
        this.externalApi = externalApi;
    }

    public String fetchData() {
        return externalApi.getData();
    }

    public void runAction(String input) {
        externalApi.performAction(input);
    }
}
