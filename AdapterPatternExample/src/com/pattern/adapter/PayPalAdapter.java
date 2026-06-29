package com.pattern.adapter;

public class PayPalAdapter implements PaymentProcessor {
    private PayPalGateway payPalGateway;

    public PayPalAdapter(PayPalGateway payPalGateway) {
        this.payPalGateway = payPalGateway;
    }

    @Override
    public void processPayment(double amount) {
        // Translates target method call to PayPalGateway specific method
        payPalGateway.makePayment(amount);
    }
}
