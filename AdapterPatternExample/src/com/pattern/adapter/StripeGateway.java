package com.pattern.adapter;

public class StripeGateway {
    public void charge(double amountInDollars) {
        System.out.println("Charging $" + amountInDollars + " using Stripe Gateway APIs.");
    }
}
