package com.pattern.adapter;

public class PayPalGateway {
    public void makePayment(double amt) {
        System.out.println("Processing payment of $" + amt + " through PayPal Gateway.");
    }
}
