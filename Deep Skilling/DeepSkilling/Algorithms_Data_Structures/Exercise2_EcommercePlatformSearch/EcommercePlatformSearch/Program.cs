/*
 * Exercise 2: E-commerce Platform Search Function
 *
 * Big O Notation Analysis:
 * - Linear Search: O(n) - worst case checks all n elements
 * - Binary Search: O(log n) - worst case checks log2(n) elements
 *
 * Best case:  Linear O(1) if first element matches | Binary O(1) if mid matches
 * Avg case:   Linear O(n/2) | Binary O(log n)
 * Worst case: Linear O(n)   | Binary O(log n)
 *
 * Conclusion: Binary Search is faster for large datasets,
 * but requires the array to be SORTED beforehand.
 * Linear Search works on unsorted data.
 */

class Program
{
    static void Main(string[] args)
    {
        // Product array for Linear Search (unsorted is fine)
        Product[] products = new Product[]
        {
            new Product(3, "Laptop", "Electronics"),
            new Product(1, "Shoes", "Footwear"),
            new Product(5, "Phone", "Electronics"),
            new Product(2, "Shirt", "Clothing"),
            new Product(4, "Headphones", "Electronics")
        };

        // Sorted array for Binary Search (sorted by ProductId)
        Product[] sortedProducts = new Product[]
        {
            new Product(1, "Shoes", "Footwear"),
            new Product(2, "Shirt", "Clothing"),
            new Product(3, "Laptop", "Electronics"),
            new Product(4, "Headphones", "Electronics"),
            new Product(5, "Phone", "Electronics")
        };

        Console.WriteLine("=== LINEAR SEARCH ===");
        Product result1 = SearchAlgorithms.LinearSearch(products, "Phone");
        Console.WriteLine(result1 != null ? $"Found: {result1}" : "Product not found");

        Console.WriteLine("\n=== BINARY SEARCH ===");
        Product result2 = SearchAlgorithms.BinarySearch(sortedProducts, 3);
        Console.WriteLine(result2 != null ? $"Found: {result2}" : "Product not found");

        Console.WriteLine("\n=== SEARCH FOR NON-EXISTENT PRODUCT ===");
        Product result3 = SearchAlgorithms.LinearSearch(products, "Watch");
        Console.WriteLine(result3 != null ? $"Found: {result3}" : "Product not found");
    }
}
