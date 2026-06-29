package com.pattern.adapter;

public class Main {
    public static void main(String[] sender) {
        System.out.println("=== Testing Adapter Pattern (Payment Adapters) ===");

        // Create third-party gateway instances (Adaptees)
        PayPalGateway payPalGateway = new PayPalGateway();
        StripeGateway stripeGateway = new StripeGateway();

        // Wrap them in their respective adapters
        PaymentProcessor payPalProcessor = new PayPalAdapter(payPalGateway);
        PaymentProcessor stripeProcessor = new StripeAdapter(stripeGateway);

        // Process payments client-side via the PaymentProcessor target interface
        System.out.println("\nProcessing payment via PayPal Adapter:");
        payPalProcessor.processPayment(120.50);

        System.out.println("\nProcessing payment via Stripe Adapter:");
        stripeProcessor.processPayment(350.00);
    }
}
