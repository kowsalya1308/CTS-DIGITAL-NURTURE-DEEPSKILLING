package com.pattern.factory;

public class Main {
    public static void main(String[] sender) {
        System.out.println("=== Testing Factory Method Pattern (Documents) ===");

        // Create factories
        DocumentFactory wordFactory = new WordDocumentFactory();
        DocumentFactory pdfFactory = new PdfDocumentFactory();
        DocumentFactory excelFactory = new ExcelDocumentFactory();

        // Generate documents using factories
        System.out.println("\n--- Creating Word Document ---");
        Document doc1 = wordFactory.createDocument();
        doc1.open();
        doc1.close();

        System.out.println("\n--- Creating PDF Document ---");
        Document doc2 = pdfFactory.createDocument();
        doc2.open();
        doc2.close();

        System.out.println("\n--- Creating Excel Document ---");
        Document doc3 = excelFactory.createDocument();
        doc3.open();
        doc3.close();
    }
}
