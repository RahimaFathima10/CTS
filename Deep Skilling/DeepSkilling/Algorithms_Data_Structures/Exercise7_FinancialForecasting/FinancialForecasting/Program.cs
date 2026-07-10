/*
 * Exercise 7: Financial Forecasting
 *
 * Concept: Recursion breaks a big problem into smaller subproblems.
 * Here, predicting value after n years = predict after 1 year, then recurse for (n-1) years.
 *
 * Optimization: Memoization stores already-computed results
 * so we don't recalculate the same values repeatedly.
 */

class Program
{
    static void Main(string[] args)
    {
        double presentValue = 10000.0;  // Starting amount (e.g. Rs. 10,000)
        double growthRate   = 0.08;     // 8% annual growth rate
        int    years        = 5;        // Forecast for 5 years

        Console.WriteLine("=== FINANCIAL FORECASTING TOOL ===");
        Console.WriteLine($"Present Value : Rs. {presentValue}");
        Console.WriteLine($"Growth Rate   : {growthRate * 100}% per year");
        Console.WriteLine($"Years         : {years}");
        Console.WriteLine();

        // Recursive solution
        double futureValue = FinancialForecasting.CalculateFutureValue(presentValue, growthRate, years);
        Console.WriteLine($"Future Value (Recursive)    : Rs. {futureValue:F2}");

        // Memoized solution
        double futureValueMemo = FinancialForecasting.CalculateFutureValueMemo(presentValue, growthRate, years);
        Console.WriteLine($"Future Value (Memoized)     : Rs. {futureValueMemo:F2}");

        Console.WriteLine();
        Console.WriteLine("=== YEAR BY YEAR FORECAST ===");
        for (int y = 1; y <= years; y++)
        {
            double value = FinancialForecasting.CalculateFutureValue(presentValue, growthRate, y);
            Console.WriteLine($"Year {y}: Rs. {value:F2}");
        }
    }
}
