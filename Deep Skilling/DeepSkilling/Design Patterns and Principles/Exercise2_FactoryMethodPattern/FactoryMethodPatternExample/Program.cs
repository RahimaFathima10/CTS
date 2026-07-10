class Program
{
    static void Main(string[] args)
    {
        DocumentFactory factory;

        // Create Word Document
        factory = new WordDocumentFactory();
        IDocument wordDoc = factory.CreateDocument();
        wordDoc.Open();

        // Create PDF Document
        factory = new PdfDocumentFactory();
        IDocument pdfDoc = factory.CreateDocument();
        pdfDoc.Open();

        // Create Excel Document
        factory = new ExcelDocumentFactory();
        IDocument excelDoc = factory.CreateDocument();
        excelDoc.Open();
    }
}
