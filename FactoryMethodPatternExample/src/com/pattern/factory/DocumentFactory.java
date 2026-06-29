package com.pattern.factory;

public abstract class DocumentFactory {
    // Factory method
    public abstract Document createDocument();

    // Factory method wrapper/operation to open a document directly
    public void openDocument() {
        Document doc = createDocument();
        doc.open();
    }
}
