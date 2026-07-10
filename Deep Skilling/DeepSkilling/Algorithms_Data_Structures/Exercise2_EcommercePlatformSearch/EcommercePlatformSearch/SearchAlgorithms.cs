public class SearchAlgorithms
{
    // LINEAR SEARCH - searches by productName
    // Time Complexity: O(n) - checks every element one by one
    public static Product LinearSearch(Product[] products, string searchName)
    {
        for (int i = 0; i < products.Length; i++)
        {
            if (products[i].ProductName.Equals(searchName, StringComparison.OrdinalIgnoreCase))
                return products[i];
        }
        return null; // not found
    }

    // BINARY SEARCH - searches by productId (array must be sorted by productId)
    // Time Complexity: O(log n) - eliminates half the elements each step
    public static Product BinarySearch(Product[] sortedProducts, int searchId)
    {
        int left = 0;
        int right = sortedProducts.Length - 1;

        while (left <= right)
        {
            int mid = left + (right - left) / 2;

            if (sortedProducts[mid].ProductId == searchId)
                return sortedProducts[mid];

            if (sortedProducts[mid].ProductId < searchId)
                left = mid + 1;
            else
                right = mid - 1;
        }
        return null; // not found
    }
}
